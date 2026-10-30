

resource "azurerm_availability_set" "windows" {
  name                         = "9410-windows-availability-set"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  managed                      = true
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2

  tags = var.tags
}

resource "azurerm_public_ip" "windows" {
  count               = 1
  name                = "9410-windows-vm-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "humber9410vm"

  tags = var.tags
}

resource "azurerm_network_interface" "windows" {
  count               = 1
  name                = "9410-windows-vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows[count.index].id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "windows" {
  count               = 1
  name                = "9410-windows-vm"
  computer_name       = "9410-WINVM"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  availability_set_id = azurerm_availability_set.windows.id

  network_interface_ids = [
    azurerm_network_interface.windows[count.index].id
  ]

  os_disk {
    name                 = "9410-windows-vm-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 127
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }

  boot_diagnostics {}

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = 1
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true

  settings = jsonencode({
    AntimalwareEnabled        = true
    RealtimeProtectionEnabled = true
    ScheduledScanSettings = {
      isEnabled = true
      day       = 7
      time      = 120
      scanType  = "Quick"
    }
  })

  tags = var.tags
}

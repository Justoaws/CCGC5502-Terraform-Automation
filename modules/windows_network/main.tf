resource "azurerm_virtual_network" "windows" {
  name                = "9410-windows-vnet"
  address_space       = ["10.20.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "windows" {
  name                 = "9410-windows-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.windows.name
  address_prefixes     = ["10.20.1.0/24"]
}

resource "azurerm_network_security_group" "windows" {
  name                = "9410-windows-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "184.148.157.13/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "windows" {
  subnet_id                 = azurerm_subnet.windows.id
  network_security_group_id = azurerm_network_security_group.windows.id
}

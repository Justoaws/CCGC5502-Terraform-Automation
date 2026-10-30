locals {
  vm_ids = merge(
    var.linux_vm_ids,
    {
      "windows" = var.windows_vm_id
    }
  )
}

resource "azurerm_managed_disk" "data" {
  for_each = local.vm_ids

  name                 = "9410-${each.key}-data-disk"
  location             = each.key == "windows" ? var.windows_location : var.location
  zone                 = each.key == "windows" ? null : var.linux_vm_zones[each.key]
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {
  for_each = local.vm_ids

  managed_disk_id    = azurerm_managed_disk.data[each.key].id
  virtual_machine_id = each.value
  lun                = 0
  caching            = "ReadWrite"
}

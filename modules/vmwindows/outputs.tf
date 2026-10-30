output "windows_vm_name" {
  description = "Windows virtual machine name"
  value       = azurerm_windows_virtual_machine.windows[0].name
}

output "windows_vm_hostname" {
  description = "Windows computer hostname"
  value       = azurerm_windows_virtual_machine.windows[0].computer_name
}

output "windows_vm_private_ip" {
  description = "Windows virtual machine private IP"
  value       = azurerm_network_interface.windows[0].private_ip_address
}

output "windows_vm_public_ip" {
  description = "Windows virtual machine public IP"
  value       = azurerm_public_ip.windows[0].ip_address
}

output "windows_vm_fqdn" {
  description = "Windows virtual machine fully qualified domain name"
  value       = azurerm_public_ip.windows[0].fqdn
}

output "windows_vm_id" {
  description = "Windows virtual machine resource ID"
  value       = azurerm_windows_virtual_machine.windows[0].id
}

output "windows_nic_id" {
  description = "Windows network interface resource ID"
  value       = azurerm_network_interface.windows[0].id
}

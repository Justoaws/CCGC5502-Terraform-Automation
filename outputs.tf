output "resource_group_name" {
  description = "Name of the main resource group"
  value       = module.rgroup.resource_group_name
}

output "resource_group_id" {
  description = "ID of the main resource group"
  value       = module.rgroup.resource_group_id
}

output "location" {
  description = "Azure region"
  value       = module.rgroup.location
}

output "linux_vm_names" {
  description = "Linux virtual machine names"
  value       = module.vmlinux.linux_vm_names
}

output "linux_vm_hostnames" {
  description = "Linux virtual machine hostnames"
  value       = module.vmlinux.linux_vm_hostnames
}

output "linux_vm_private_ips" {
  description = "Linux private IP addresses"
  value       = module.vmlinux.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  description = "Linux public IP addresses"
  value       = module.vmlinux.linux_vm_public_ips
}

output "linux_vm_fqdns" {
  description = "Linux fully qualified domain names"
  value       = module.vmlinux.linux_vm_fqdns
}

output "windows_vm_name" {
  description = "Windows virtual machine name"
  value       = module.vmwindows.windows_vm_name
}

output "windows_vm_hostname" {
  description = "Windows computer hostname"
  value       = module.vmwindows.windows_vm_hostname
}

output "windows_vm_private_ip" {
  description = "Windows private IP address"
  value       = module.vmwindows.windows_vm_private_ip
}

output "windows_vm_public_ip" {
  description = "Windows public IP address"
  value       = module.vmwindows.windows_vm_public_ip
}

output "windows_vm_fqdn" {
  description = "Windows fully qualified domain name"
  value       = module.vmwindows.windows_vm_fqdn
}

output "data_disk_names" {
  description = "Names of the four data disks"
  value       = module.datadisk.data_disk_names
}

output "data_disk_ids" {
  description = "IDs of the four data disks"
  value       = module.datadisk.data_disk_ids
}

output "load_balancer_name" {
  description = "Name of the public load balancer"
  value       = module.loadbalancer.load_balancer_name
}

output "load_balancer_public_ip" {
  description = "Public IP address of the load balancer"
  value       = module.loadbalancer.load_balancer_public_ip
}

output "load_balancer_fqdn" {
  description = "Fully qualified domain name of the load balancer"
  value       = module.loadbalancer.load_balancer_fqdn
}

output "postgresql_server_name" {
  description = "Name of the PostgreSQL Flexible Server"
  value       = module.database.postgresql_server_name
}

output "postgresql_server_fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = module.database.postgresql_server_fqdn
}

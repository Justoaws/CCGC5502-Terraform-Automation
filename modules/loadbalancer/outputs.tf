output "load_balancer_name" {
  description = "Name of the public load balancer"
  value       = azurerm_lb.this.name
}

output "load_balancer_id" {
  description = "Resource ID of the load balancer"
  value       = azurerm_lb.this.id
}

output "load_balancer_public_ip" {
  description = "Public IP address of the load balancer"
  value       = azurerm_public_ip.loadbalancer.ip_address
}

output "load_balancer_fqdn" {
  description = "Fully qualified domain name of the load balancer"
  value       = azurerm_public_ip.loadbalancer.fqdn
}

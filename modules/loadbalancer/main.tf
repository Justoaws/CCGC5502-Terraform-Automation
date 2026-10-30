resource "azurerm_public_ip" "loadbalancer" {
  name                = "9410-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "lb9410-linux"

  tags = var.tags
}

resource "azurerm_lb" "this" {
  name                = "9410-linux-loadbalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "9410-lb-frontend"
    public_ip_address_id = azurerm_public_ip.loadbalancer.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "linux" {
  name            = "9410-linux-backend-pool"
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "http" {
  name            = "9410-http-health-probe"
  loadbalancer_id = azurerm_lb.this.id
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}

resource "azurerm_lb_rule" "http" {
  name                           = "9410-http-loadbalancing-rule"
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "9410-lb-frontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.linux.id]
  probe_id                       = azurerm_lb_probe.http.id
}

resource "azurerm_network_interface_backend_address_pool_association" "linux" {
  for_each = var.linux_nic_ids

  network_interface_id    = each.value
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.linux.id
}

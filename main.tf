module "rgroup" {
  source = "./modules/rgroup"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source = "./modules/network"

  resource_group_name  = module.rgroup.resource_group_name
  location             = var.location
  tags                 = var.tags
  virtual_network_name = "9410-HumberID-VNET"
  subnet_name          = "9410-HumberID-SUBNET"
  nsg_name             = "9410-HumberID-NSG"
}

module "common" {
  source = "./modules/common"

  resource_group_name  = module.rgroup.resource_group_name
  location             = var.location
  tags                 = var.tags
  storage_account_name = "n10039410common"
}

module "vmlinux" {
  source = "./modules/vmlinux"

  resource_group_name = module.rgroup.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                = var.tags

  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  vm_size             = "Standard_D2plds_v6"
}

module "windows_network" {
  source = "./modules/windows_network"

  resource_group_name = module.rgroup.resource_group_name
  location            = var.windows_location
  tags                = var.tags
}

module "vmwindows" {
  source = "./modules/vmwindows"

  resource_group_name = module.rgroup.resource_group_name
  location            = var.windows_location
  subnet_id           = module.windows_network.subnet_id
  storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                = var.tags

  admin_username = "azureadmin"
  admin_password = var.windows_admin_password
  vm_size        = "Standard_D2as_v7"
}

module "datadisk" {
  source = "./modules/datadisk"

  resource_group_name = module.rgroup.resource_group_name
  location            = var.location
  windows_location    = var.windows_location
  tags                = var.tags

  linux_vm_ids   = module.vmlinux.linux_vm_ids
  linux_vm_zones = module.vmlinux.linux_vm_zones
  windows_vm_id  = module.vmwindows.windows_vm_id

  disk_size_gb = 10
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  resource_group_name = module.rgroup.resource_group_name
  location            = var.location
  tags                = var.tags
  linux_nic_ids       = module.vmlinux.linux_nic_ids
}

module "database" {
  source = "./modules/database"

  resource_group_name    = module.rgroup.resource_group_name
  location               = var.location
  tags                   = var.tags
  administrator_login    = "pgadmin9410"
  administrator_password = var.postgres_admin_password
}

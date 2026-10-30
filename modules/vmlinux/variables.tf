variable "resource_group_name" {
  description = "Resource group containing Linux virtual machines"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Linux virtual machines"
  type        = string
}

variable "tags" {
  description = "Mandatory project tags"
  type        = map(string)
}

variable "storage_account_uri" {
  description = "Storage account for boot diagnostics"
  type        = string
}

variable "admin_username" {
  description = "Linux administrator username"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the existing SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  description = "Azure Linux VM size"
  type        = string
  default     = "Standard_D2plds_v6"
}

variable "vm_names" {
  description = "Linux VM names"
  type        = set(string)
  default = [
    "9410-linux-vm1",
    "9410-linux-vm2",
    "9410-linux-vm3"
  ]
}

variable "vm_zones" {
  description = "Availability zone assigned to each Linux VM"
  type        = map(string)
  default = {
    "9410-linux-vm1" = "1"
    "9410-linux-vm2" = "2"
    "9410-linux-vm3" = "3"
  }
}

variable "resource_group_name" {
  description = "Resource group containing the Windows virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Windows virtual machine"
  type        = string
}

variable "storage_account_uri" {
  description = "Storage account used for boot diagnostics"
  type        = string
}

variable "tags" {
  description = "Mandatory project tags"
  type        = map(string)
}

variable "admin_username" {
  description = "Windows administrator username"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Windows administrator password"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Windows virtual machine size"
  type        = string
  default     = "Standard_D2as_v7"
}

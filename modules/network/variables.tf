variable "resource_group_name" {
  description = "Resource group containing the network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Required project tags"
  type        = map(string)
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "nsg_name" {
  description = "Network security group name"
  type        = string
}

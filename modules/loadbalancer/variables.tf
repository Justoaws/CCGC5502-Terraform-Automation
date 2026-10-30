variable "resource_group_name" {
  description = "Resource group containing the load balancer"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Mandatory project tags"
  type        = map(string)
}

variable "linux_nic_ids" {
  description = "Network interface IDs of the Linux virtual machines"
  type        = map(string)
}

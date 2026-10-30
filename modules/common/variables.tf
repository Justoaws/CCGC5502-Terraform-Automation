variable "resource_group_name" {
  description = "Resource group for shared resources"
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

variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}

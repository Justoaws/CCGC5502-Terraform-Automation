variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Main resource group name"
  type        = string
  default     = "9410-HumberID-RG"
}

variable "tags" {
  description = "Mandatory tags for the project"
  type        = map(string)
  default = {
    Project        = "CCGC 5502 Terraform Project"
    Name           = "Justin.Mebodo"
    ExpirationDate = "2027-12-31"
    Environment    = "Learning"
  }
}

variable "windows_admin_password" {
  description = "Administrator password for the Windows virtual machine"
  type        = string
  sensitive   = true
}

variable "postgres_admin_password" {
  description = "Administrator password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "windows_location" {
  description = "Azure region for Windows resources"
  type        = string
  default     = "canadaeast"
}

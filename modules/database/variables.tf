variable "resource_group_name" {
  description = "Resource group containing PostgreSQL"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Project tags"
  type        = map(string)
}

variable "administrator_login" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "pgadmin9410"
}

variable "administrator_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}

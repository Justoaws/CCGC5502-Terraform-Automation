variable "resource_group_name" {
  description = "Resource group containing the data disks"
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

variable "linux_vm_ids" {
  description = "IDs of the three Linux virtual machines"
  type        = map(string)
}

variable "windows_vm_id" {
  description = "ID of the Windows virtual machine"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of each managed data disk in GB"
  type        = number
  default     = 10
}

variable "windows_location" {
  description = "Azure region for the Windows data disk"
  type        = string
}

variable "linux_vm_zones" {
  description = "Availability zones assigned to Linux virtual machines"
  type        = map(string)
}

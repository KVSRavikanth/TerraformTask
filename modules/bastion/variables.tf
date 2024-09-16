variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_id" {
  description = "Management Subnet ID"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}
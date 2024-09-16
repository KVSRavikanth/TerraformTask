variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}

variable "address_space" {
  description = "Address Space for Virtual Network"
  type        = list(string)
}
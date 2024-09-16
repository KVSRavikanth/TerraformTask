variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "region" {
  description = "Azure Region to deploy resources"
  type        = string
  default     = "UK South"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Address Space for Virtual Network"
  type        = list(string)
}
resource "File: modules/firewall/variables.tf

```terraform
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_name" {
  description = "Firewall Subnet Name"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}
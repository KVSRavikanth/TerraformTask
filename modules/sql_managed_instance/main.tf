resource "azurerm_sql_managed_instance" "main" {
  name                             = "sqlmi"
  location                         = var.region
  resource_group_name              = var.resource_group_name
  subnet_id                        = var.subnet_id
  administrator_login              = "sqladmin"
  administrator_login_password     = var.admin_password
  sku_name                         = "GP_Gen5_2"
  storage_account_type             = "LRS"
  vcores                           = 4
  storage_size_in_gb               = 256
  license_type                     = "LicenseIncluded"
  tags                             = var.tags
}

variable "admin_password" {
  description = "The admin password for SQL Managed Instance"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags for the SQL Managed Instance"
  type        = map(string)
}
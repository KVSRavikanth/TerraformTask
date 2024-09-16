provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "network" {
  source              = "./modules/network"
  region              = var.region
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  address_space = ["10.0.0.0/16"]
}

module "firewall" {
  source              = "./modules/firewall"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.firewall_subnet_name
}

module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.management_subnet_name
}

module "gateway" {
  source              = "./modules/gateway"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.gateway_subnet_name
}

module "app_gateway" {
  source              = "./modules/app_gateway"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.frontend_subnet_name
}

module "sql_managed_instance" {
  source              = "./modules/sql_managed_instance"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.backend_subnet_name
}

module "virtual_machines" {
  source              = "./modules/virtual_machines"
  resource_group_name = var.resource_group_name
  vnet_name           = module.network.vnet_name
  subnet_name         = module.network.backend_subnet_name
}
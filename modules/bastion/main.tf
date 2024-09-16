resource "azurerm_bastion_host" "main" {
  name                = "bastion-host"
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_name            = "bastion-${azurerm_virtual_network.main.name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.main.id
  }
}

resource "azurerm_public_ip" "main" {
  name                = "bastion-public-ip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
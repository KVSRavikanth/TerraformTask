resource "azurerm_virtual_network_gateway" "main" {
  name                = "vnet-gateway"
  type                = string
  location            = var.region
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vpngatewayconfig"
    public_ip_address_id          = azurerm_public_ip.main.id
    private_ip_address_allocation = "Dynamic" subnet_id                    = var.subnet_id
  }

  sku {
    name     = "VpnGw1"
    tier     = "VpnGw1"
  }

  vpn_type          = "RouteBased"
  enable_bgp        = false
  active_active     = false
  gateway_type      = "Vpn"
  vpn_client_protocols = ["SSTP", "IKEv2"]
}

resource "azurerm_public_ip" "main" {
  name                = "gateway-pip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}
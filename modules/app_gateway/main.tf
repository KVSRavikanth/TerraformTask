resource "azurerm_application_gateway" "main" {
  name                = "app-gateway"
  location            = var.region
  resource_group_name = var.resource_group_name

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIpConfig"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  backend_address_pool {
    name = "backendAddressPool"
  }

  backend_http_settings {
    name                  = "backendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "appGatewayFrontendIpConfig"
    frontend_port_name             = "frontendPort" protocol                        = "Http"
  }

  request_routing_rule {
    name                       = "requestRoutingRule"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendAddressPool"
    backend_http_settings_name = "backendHttpSettings"
  }
}

resource "azurerm_public_ip" "main" {
  name                = "app-gateway-pip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
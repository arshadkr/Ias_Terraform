terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.58.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "dc95e83d-1c9d-479a-ad57-cd4b5a75b142"
  client_id       = "84b5cc6d-8e46-4bc9-a1b0-2c80b447605f"
  client_secret   = "61-8Q~1YKobvh1U4S936PlZ~m4Sr1n~BYX8zPa9m"
  tenant_id       = "b35504a5-c85f-4806-addb-8e4f39832b8f"
  features {}
}

resource "azurerm_resource_group" "app_grp" {
  name     = "app-grp"
  location = "Japan East"
}

resource "azurerm_sql_server" "app_server" {
  name                         = "appserver001"
  resource_group_name          = azurerm_resource_group.app_grp.name
  location                     = azurerm_resource_group.app_grp.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Test@321"
}

resource "azurerm_sql_database" "appdb" {
  name                = "appdb"
  resource_group_name = azurerm_resource_group.app_grp.name
  location            = azurerm_resource_group.app_grp.location
  server_name         = azurerm_sql_server.app_server.name
  depends_on = [
    azurerm_sql_server.app_server
  ]
}

resource "azurerm_sql_firewall_rule" "app_server_firewall_rule" {
  name                = "app_server_firewall_rule"
  resource_group_name = azurerm_resource_group.app_grp.name
  server_name         = azurerm_sql_server.app_server.name
  start_ip_address    = "113.154.47.146"
  end_ip_address      = "113.154.47.146"
  depends_on = [
    azurerm_sql_server.app_server
  ]
}

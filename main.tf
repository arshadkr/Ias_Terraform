
resource "azurerm_resource_group" "apps_grp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_sql_server" "app_server" {
  name                         = var.app_server001
  resource_group_name          = azurerm_resource_group.apps_grp.name
  location                     = azurerm_resource_group.apps_grp.location
  version                      = var.sql_version
  administrator_login          = var.sql_uname
  administrator_login_password = var.sql_passwd
}

resource "azurerm_sql_database" "appdb" {
  name                = var.app_db
  resource_group_name = azurerm_resource_group.apps_grp.name
  location            = azurerm_resource_group.apps_grp.location
  server_name         = azurerm_sql_server.app_server.name
  depends_on = [
    azurerm_sql_server.app_server
  ]
}

resource "azurerm_sql_firewall_rule" "app_server_firewall_rule" {
  name                = var.app_server_firewall_rule
  resource_group_name = azurerm_resource_group.apps_grp.name
  server_name         = azurerm_sql_server.app_server.name
  start_ip_address    = "113.154.47.146"
  end_ip_address      = "113.154.47.146"
  depends_on = [
    azurerm_sql_server.app_server
  ]
}

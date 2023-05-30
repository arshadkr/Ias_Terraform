
resource "azurerm_resource_group" "apps-grp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_sql_server" "app-server" {
  name                         = var.app_server001
  resource_group_name          = azurerm_resource_group.apps-grp.name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.sql_uname
  administrator_login_password = var.sql_passwd
}

resource "azurerm_sql_database" "appdb" {
  name                = var.app_db
  resource_group_name = azurerm_resource_group.apps-grp.name
  location            = var.location
  server_name         = azurerm_sql_server.app-server.name
  depends_on = [
    azurerm_sql_server.app-server
  ]
}

resource "azurerm_sql_firewall_rule" "app_server_firewall_rule" {
  name                = var.app_server_firewall_rule
  resource_group_name = azurerm_resource_group.apps-grp.name
  server_name         = azurerm_sql_server.app-server.name
  start_ip_address    = "113.154.47.146"
  end_ip_address      = "113.154.47.146"
  depends_on = [
    azurerm_sql_server.app-server
  ]
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.apps-grp.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                 = var.storage_container_name
  storage_account_name = var.storage_name
}

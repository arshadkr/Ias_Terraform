terraform {
  backend "azurerm" {
    resource_group_name  = var.azurerm_resource_group
    storage_account_name = var.storage_name
    container_name       = var.storage_container_name
    key                  = "terraform.tfstate"
  }
}

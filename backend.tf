terraform {
  backend "azurerm" {
    resource_group_name  = "apps_grp"
    storage_account_name = "tfstorage"
    container_name       = "tfstatecontainer"
    key                  = "terraform.tfstate"
  }
}

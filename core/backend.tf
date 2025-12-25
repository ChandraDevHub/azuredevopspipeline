# terraform {
#   backend "azurerm" {
#     resource_group_name  = "rg-chandra"
#     storage_account_name = "stgchandra2"
#     container_name       = "tfstate"
#     key                  = "${var.environment}.terraform.tfstate"
#   }
# }

terraform {
  backend "azurerm" {}
}

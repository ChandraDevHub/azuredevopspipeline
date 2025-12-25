module "resource_groups" {
  source          = "../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}
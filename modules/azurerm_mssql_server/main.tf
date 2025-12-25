resource "azurerm_mssql_servers" "mssql_servers" {
  for_each = var.azurerm_mssql_servers

  name                         = each.value.name
  location                     = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name          = var.o_rg_dtls[each.value.rg_key].name
  version                      = each.value.version
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_login_password

  # minimum_tls_version = lookup(each.value, "minimum_tls_version", null)

  # azuread_administrator {
  #   login_username = each.value.azuread_administrator.login_username
  #   object_id      = each.value.azuread_administrator.object_id
  # }

  tags = lookup(each.value, "tags", null)
  
}
resource "azurerm_mssql_database" "mssql_databases" {
  for_each = var.mssql_databases

  name                = each.value.name
  server_id           = each.value.server_id
  collation           = lookup(each.value, "collation", null)
  max_size_gb         = lookup(each.value, "max_size_gb", null)
  sku_name            = lookup(each.value, "sku_name", null)
  tags                = lookup(each.value, "tags", null)
  enclave_type        = lookup(each.value, "enclave_type", null)

  lifecycle {
    prevent_destroy = lookup(each.value, "prevent_destroy", false)
  }
}
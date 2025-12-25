resource "azurerm_public_ip" "public_ips" {
  for_each = var.public_ips

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name
  allocation_method   = each.value.allocation_method
  sku                 = optional(each.value.sku, null)

  tags = optional(each.value.tags, null)
  
}
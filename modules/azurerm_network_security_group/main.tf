resource "azurerm_network_security_group" "network_security_groups" {
  for_each = var.network_security_groups

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name

  security_rule = each.value.security_rules
  tags = optional(each.value.tags, null)
  
}
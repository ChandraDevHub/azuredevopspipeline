resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.o_rg_dtls[each.value.rg_key].name
  virtual_network_name = var.o_vnets_dtls[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
  service_endpoints = optional(each.value.service_endpoints, null)
}
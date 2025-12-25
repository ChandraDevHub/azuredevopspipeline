resource "azurerm_virtual_network" "virtual_networks"{
for_each = var.virtual_networks

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name
  address_space       = each.value.address_space

  tags = each.value.tags
}
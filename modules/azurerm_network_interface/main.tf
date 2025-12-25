resource "azurerm_network_interface" "network_interfaces" {
  for_each = var.network_interfaces

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.o_subnets_dtls[each.value.ip_configuration.subnet_key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }

  tags = optional(each.value.tags, null)
  
}
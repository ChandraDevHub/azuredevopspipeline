resource "azurerm_bastion_host" "bastion_hosts" {
  for_each = var.bastion_hosts

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name
  dns_name            = each.value.dns_name
  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = var.o_subnets_dtls[each.value.ip_configuration.subnet_key].id
    public_ip_address_id = var.o_pips_dtls[each.value.ip_configuration.public_ip_address_key].id
  }

  tags = each.value.tags
}
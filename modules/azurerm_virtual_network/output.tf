output "o_vnets_dtls" {
  value = {
    for key, vnet in azurerm_virtual_network.virtual_networks :
    key => {
      id                = vnet.id
      name              = vnet.name
  }
}
}
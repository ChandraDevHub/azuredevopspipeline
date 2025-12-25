output "o_nics_dtls" {
  description = "output network interface card details"
  value = {
    for key, nic in azurerm_network_interface.network_interfaces :
    key => {
      id                = nic.id
      name              = nic.name
  }
}
}
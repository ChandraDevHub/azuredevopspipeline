output "o_subnets_dtls" {
  value = {
    for key, subnet in azurerm_subnet.subnets :
    key => {
      id                = subnet.id
      name              = subnet.name
  }
}
}
output "o_nsg_dtls" {
  description = "output network security group"
 value={
    for key, nsg in azurerm_network_security_group.network_security_groups :
    key => {
      id                = nsg.id
      name              = nsg.name
 }
}
}
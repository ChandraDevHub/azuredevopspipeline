output "o_bastion_hosts_dtls" {
  description = "output Bastion Host details"
  value = {
    for key, bastion in azurerm_bastion_host.bastion_hosts :
    key => {
      id                = bastion.id
      name              = bastion.name
  }
}
}
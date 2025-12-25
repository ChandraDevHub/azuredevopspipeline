output "o_pips_dtls" {
  description = "output public IPs"
  value = {
    for key, pip in azurerm_public_ip.public_ips :
    key => {
      id                = pip.id
      ip_address              = pip.ip_address
  }
}
}   
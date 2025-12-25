output "o_rg_dtls" {
  description = "output resource group details"
  value = {
    for key, rg in azurerm_resource_group.resource_groups :
    key => {
      name = rg.name
      location = rg.location
  }
}
}
variable "network_security_groups" {
  description = "Network Security Groups"
  type = map(object({
    name = string
    # location=string
    # rg_name=string
    rg_key=string

    security_rules=optional(list(object({
      name                     = string
      priority                 = number
      direction                = string
      access                   = string
      protocol                 = string
      source_port_range        = string
      destination_port_range   = string
      source_address_prefix    = string
      destination_address_prefix = string
    })))
    tags=optional(map(string))
  }))
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type=map(object({
    name = string
    location=string
  }))
}
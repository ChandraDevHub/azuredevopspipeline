variable "network_interfaces" {
  description = "Network Interfaces"
  type=map(object({
    name = string
    # location=string
    # resource_group_name=string
    rg_key=string

    ip_configuration = object({
        name = string
        # subnet_id = string
        subnet_key = string
        private_ip_address_allocation = string
    })

    tags=optional(map(string))
  }))
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type = map(object({
    name = string
    location=string
  }))
}

variable "o_subnets_dtls" {
  description = "output subnets details"
  type = map(object({
    id = string
  }))
}

variable "o_pips_dtls" {
  description = "output public IPs details"
  type = map(object({
    id = string
  }))
}
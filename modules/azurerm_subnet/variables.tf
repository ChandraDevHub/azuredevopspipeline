variable "subnets" {
  description = "Azure Subnets"
  type=map(object({
    name = string
    vnet_key=string
    rg_key=string
    address_prefixes=list(string)   
    service_endpoints=optional(list(string))
  }))
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type = map(object({
    name = string
    location=string
  }))
}

variable "o_vnets_dtls" {
  description = "output virtual network details"
  type = map(object({
    id = string
    name=string
  }))
}
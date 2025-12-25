variable "virtual_networks" {
  description = "Virtual Networks"
  type=map(object({
    name = string
    #location=string
    #rg_name=string
    rg_key=string
    address_space=string
    tags=map(string)
    }))
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type = map(object({
    name = string
    location=string
  }))
}
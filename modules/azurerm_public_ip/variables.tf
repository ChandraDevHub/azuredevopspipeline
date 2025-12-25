variable "public_ips" {
  description = "Public Ips"
  type = map(object({
    name = string
    # location=string
    # rg_name=string
    rg_key=string
    allocation_method=string
    sku=optional(string)
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
variable "bastion_hosts" {
  description = "Bastion Host"
  type = map(object({
    name = string
    rg_key = string
    # resource_group_name = string
    # location = string
    ip_configuration = object({
      name = string
      public_ip_address_key = string
    #   public_ip_address_id = string
    #   subnet_id = string
    subnet_key = string
    })
    tags = optional(map(string))
  }))
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type=map(object({
    name = string
    location=string
  }))
}

variable "o_pips_dtls" {
  description = "output public ip details"
  type = map(object({
    id = string
    ip_address=string
  }))
}

variable "o_subnets_dtls" {
  description = "output subnet details"
  type=map(object({
    id = string
    name=string
  }))
}
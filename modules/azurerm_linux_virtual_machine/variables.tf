variable "linux_virtual_machines" {
  description = "Linux Virtual Machine"
  type=map(object({
    name = string
    # location=string
    # resource_group_name=string
    rg_key=string
    size=string
    admin_username=string
    admin_password=string
disable_password_authentication = optional(bool, false)
    nic_keys=list(string)

    os_disk = object({
        caching = string
        storage_account_type = string
    })

    source_image_reference = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
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

variable "o_nics_dtls" {
  description = "output network interface card details"
  type = map(object({
    id = string
    name=string
  }))   
}
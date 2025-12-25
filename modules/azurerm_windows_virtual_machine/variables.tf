variable "windows_virtual_machines" {
  description = "Windows Virtual Machines"
  type = map(object({
    name                   = string
    rg_key                 = string
    # location               = string
    size                   = string
    admin_username         = string
    admin_password         = string

    nic_keys = list(string)

    os_disk = object({
      caching              = optional(string)
      storage_account_type = optional(string)
      disk_size_gb         = optional(number)
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    tags                   = optional(map(string))
  })) 
}

variable "o_rg_dtls" {
  description = "output resource group details"
  type = map(object({
    name     = string
    location = string
  }))   
}

variable "o_nics_dtls" {
  description = "output network interface card details"
  type = map(object({
    id   = string
    name = string
  }))   
}
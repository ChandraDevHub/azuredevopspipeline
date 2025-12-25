###############################
#   Organization Metadata
###############################

variable "org" {
  description = "Organization or company short code (e.g., contoso, msft)"
  type        = string
}

variable "project" {
  description = "Project/application name (e.g., erp, billing, portal)"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, test, prod)"
  type        = string
}

###############################
#   Azure Authentication
###############################

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

###############################
#   Core Infra Variables
###############################
variable "resource_groups" {
  description = "Resource Groups"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))
}

variable "virtual_networks" {
  description = "Virtual Networks"
  type = map(object({
    name = string
    #location=string
    #rg_name=string
    rg_key        = string
    address_space = string
    tags          = map(string)
  }))
}

variable "subnets" {
  description = "Azure Subnets"
  type = map(object({
    name              = string
    vnet_key          = string
    rg_key            = string
    address_prefixes  = list(string)
    service_endpoints = optional(list(string))
  }))
}

variable "network_interfaces" {
  description = "Network Interfaces"
  type = map(object({
    name = string
    # location=string
    # resource_group_name=string
    rg_key = string

    ip_configuration = object({
      name = string
      # subnet_id = string
      subnet_key                    = string
      private_ip_address_allocation = string
    })

    tags = optional(map(string))
  }))
}

variable "network_security_groups" {
  description = "Network Security Groups"
  type = map(object({
    name = string
    # location=string
    # rg_name=string
    rg_key = string

    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })))
    tags = optional(map(string))
  }))
}

variable "subnet_nsg_associations" {
  description = "Subnet Network Security Group Associations"
  type = map(object({
    subnet_id                 = string
    network_security_group_id = string
  }))
}

variable "linux_virtual_machines" {
  description = "Linux Virtual Machine"
  type = map(object({
    name = string
    # location=string
    # resource_group_name=string
    rg_key                          = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    nic_keys                        = list(string)
    disable_password_authentication = optional(bool, false)
    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    tags = optional(map(string))

  }))
}

variable "public_ips" {
  description = "Public Ips"
  type = map(object({
    name = string
    # location=string
    # rg_name=string
    rg_key            = string
    allocation_method = string
    sku               = optional(string)
    tags              = optional(map(string))
  }))
}

variable "bastion_hosts" {
  description = "Bastion Host"
  type = map(object({
    name   = string
    rg_key = string
    # resource_group_name = string
    # location = string
    ip_configuration = object({
      name                  = string
      public_ip_address_key = string
      #   public_ip_address_id = string
      #   subnet_id = string
      subnet_key = string
    })
    tags = optional(map(string))
  }))
}

variable "windows_virtual_machines" {
  description = "Windows Virtual Machines"
  type = map(object({
    name   = string
    rg_key = string
    # location               = string
    size           = string
    admin_username = string
    admin_password = string

    nic_keys = list(string)

    os_disk = object({
      caching              = optional(string)
      storage_account_type = optional(string)

    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    tags = optional(map(string))
  }))
}

variable "mssql_databases" {
  description = "MS SQL Database"
  type = map(object({
    name            = string
    server_id       = string
    collation       = optional(string)
    max_size_gb     = optional(number)
    sku_name        = optional(string)
    tags            = optional(map(string))
    enclave_type    = optional(string)
    prevent_destroy = optional(bool)
  }))
}
variable "azurerm_mssql_servers" {
  description = "Microsoft SQL Server"
  type = map(object({
    name                 = string
    rg_key               = string
    version              = string
    admin_login          = string
    admin_login_password = string

    tags = optional(map(string))
  }))
}

variable "azurerm_mssql_servers" {
  description = "Microsoft SQL Server"
  type = map(object({
    name = string
    # location=string
    # rg_name=string
    rg_key=string
    version=string
    admin_login=string
    admin_login_password=string

    # minimum_tls_version=optional(string)

    # azuread_administrator={
    #     login_username=string
    #     object_id=string
    # }
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
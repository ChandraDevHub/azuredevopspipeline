variable "mssql_databases" {
  description = "MS SQL Database"
  type = map(object({
    name = string
    server_id = string
    collation = optional(string)
    max_size_gb = optional(number)
    sku_name = optional(string)
    tags = optional(map(string))
    enclave_type = optional(string)
    prevent_destroy = optional(bool)
}))
}
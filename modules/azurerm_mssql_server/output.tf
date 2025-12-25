output "o_mssql_server_dtls" {
  description = "Output MS SQL Server Details"
  value = {
    for key, server in azurerm_sql_server.mssql_servers :
    key => {
      id                = server.id
      name              = server.name
  }
}
}
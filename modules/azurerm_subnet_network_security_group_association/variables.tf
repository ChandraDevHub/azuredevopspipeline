variable "subnet_nsg_associations" {
  description = "Subnet Network Security Group Associations"
  type = map(object({
    subnet_id = string
    network_security_group_id =string
  }))
}
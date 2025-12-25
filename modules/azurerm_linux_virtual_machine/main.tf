resource "azurerm_linux_virtual_machine" "linux_virtual_machines" {
  for_each = var.linux_virtual_machines

  name                = each.value.name
  location            = var.o_rg_dtls[each.value.rg_key].location
  resource_group_name = var.o_rg_dtls[each.value.rg_key].name
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    var.o_nics_dtls[each.value.nic_keys].id,
  ]

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  tags = optional(each.value.tags, null)
  
}
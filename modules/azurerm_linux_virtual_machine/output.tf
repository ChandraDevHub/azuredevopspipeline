output "o_vms_dtls" {
  description = "output virtual machine details"
  value = {
    for key, vm in azurerm_linux_virtual_machine.linux_virtual_machines :
    key => {
      id                = vm.id
      name              = vm.name
  }
}
}
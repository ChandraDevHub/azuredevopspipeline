output "o_windows_vms_dtls" {
  description = "Windows virtual machines"
  value = {
    for key, vm in azurerm_windows_virtual_machine.windows_virtual_machines :
    key => {
      id                = vm.id
      name              = vm.name
  }
}
}
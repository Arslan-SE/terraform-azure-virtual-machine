output "vm_ids" {
  value = "${azurerm_virtual_machine.my_vm.*.id}"
}

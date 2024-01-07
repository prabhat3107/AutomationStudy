output "ip_addresses" {

    description = "The list of ip addresses"
    value = vsphere_virtual_machine.vm.guest_ip_addresses
  
}

output "vm_default_ip_address" {

    description = "The default ip address"
    value = vsphere_virtual_machine.vm.default_ip_address
  
}
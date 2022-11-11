
output "vm_default_ipaddr" {
    description = "Default IP address"
    value = values(module.create_vms).*.vm_default_ip_address

}

output "vm_ipaddress" {

    description = "The list of IP addresses "
    value = values(module.create_vms).*.ip_addresses
  
}




output "vm_cos8_default_ipaddr" {
    description = "Default IP address"
    value = values(module.create_cos8_vms).*.vm_default_ip_address

}

output "vm_userver_default_ipaddr" {
    description = "Default IP address"
    value = values(module.create_userver_vms).*.vm_default_ip_address

}

#output "vm_ipaddress" {

#    description = "The list of IP addresses "
#    value = values(module.create_vms).*.ip_addresses
  
#}



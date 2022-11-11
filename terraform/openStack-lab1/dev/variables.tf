variable "dc_name" {

    description = "Name of the DC"
    type = string
    default = "SriAuronetHDC1"

}

variable "vcenter_host_name" {

    description = "Host name of the Vcenter host"
    type = string
    default = "vcenter1.sriauronet.local"
  
}

variable "vcenter_user_name" {

    description = "Name of the Admin accont who can creaet VMs"
    type = string
    sensitive = true
    default = "administrator@sriauronet.local"
  
}

variable "vcneter_user_password" {

    description = "Password "
    type =  string
    sensitive = true
    default = "Beauty!123"

}

variable "resource_pool_name" {
    description = "Name of the Vsphere resource pool"
    type = string
    default = "esxi-1.sriauronet.local/Resources"
  
}

variable "parent_project_folder_name" {

    description = "Parent Project folder name"
    type = string
  
}

variable "project_folder_name" {

    description = "Project folder name"
    type = string

}

variable "vsphere_datastore_name" {

    description = "Name of the vshpere datastore where VM is parked"
    type = string
    default =  "datastore2"


}


variable "vm_network_name_1" {
    description = "Name of the devfault virtual vsphere network"
    type = string
    default = "VMNet-G1"
}

variable "vm_network_name_2" {
    description = "Name of the devfault virtual vsphere network"
    type = string
    default = "VMNet-G2"
}

variable "vm_network_name_3" {
    description = "Name of the devfault virtual vsphere network"
    type = string
    default = "VMNet-G3"
}


variable "vm_network_name_4" {
    description = "Name of the devfault virtual vsphere network"
    type = string
    default = "ExternetlNet"
}

variable "vm_template_name" {

    description = "Name of the VM template to clone from "
    type = string
    default = "userver-22.04-lts-template"
  
}



// vm list 

variable "vm_list" {
  description = "List of VM properties object"
  type        = list(
                    object({
                            vm_name    = string
                            vm_host_name     = string
                            vm_num_cpus = number
                            vm_memory = number
                            vm_nic_config = list(
                                                object({
                                                        ipv4_address   = string
                                                        ipv4_netmask     = string
                                                    })
                                                )                      
                    })
                )
}

variable "network_node_vm_list" {
  description = "List of VM properties object"
  type        = list(
                    object({
                            vm_name    = string
                            vm_host_name     = string
                            vm_num_cpus = number
                            vm_memory = number
                            vm_nic_config = list(
                                                object({
                                                        ipv4_address   = string
                                                        ipv4_netmask     = string
                                                    })
                                                )                      
                    })
                )
}


//Common VM variables 


variable "vm_ipv4_netmask" {

    description = "VM ipv4 address"
    type = number

  
}

variable "dns_server_list" {

    description = "VM ipv4 address"
    type = list(string)

}


variable "dns_suffix_list" {

    description = "VM dns suffix list"
    type = list(string)

  
}

variable "vm_ipv4_gateway" {

    description = "VM ipv4 gateway"
    type = string

}

variable "vm_ipv4_gateway_2" {

    description = "VM ipv4 gateway"
    type = string

}
/*variable "vm_host_name" {

    description = "VM host name"
    type = string

}
*/

variable "vm_domain_name" {

    description = "VM domain name"
    type = string

}

variable "vm_user_name" {
    description = "VM user name"
    type = string
    default = "prabhat"
    sensitive = true
  
}


variable "vm_user_password" {

    description = "VM user password"
    type = string
    default = "Beauty!123"
    sensitive = true
  
}

variable "provisioning_commands" {

    description = "The list of commands to be executed after the VM hasbeen created"
    type = list(string)
    
  
}
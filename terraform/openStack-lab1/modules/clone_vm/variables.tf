
variable "resource_pool_id" {
    description = "Resource Pool ID"
    type = string 
  
}
variable "datastore_id" {
    description = "Data store ID"
    type = string 
  
}

variable "vm_name" {

    description = "Name of the VM to be created"
    type = string
  
}


variable "project_folder_name" {

    description = "VM folder_path"
    type = string
  
}

variable "vm_num_cpus" {

    description = "Number CPus"
    type = number
  
}

variable "vm_memory" {

    description = "Allocated Memory"
    type =  number
  
}

variable "template_guest_id" {
    description = "template guest ID"
    type = string 
  
}

variable "vm_template_id" {
    description = "template UUID"
    type = string 
  
}


variable "template_firmware" {
    description = "Template Firmware"
    type = string 
}


variable "template_scsi_type" {
    description = "Template scsi type"
    type = string 
}


variable "vm_nic1_network_id" {
    description = "Network ID"
    type = string 
  
}

variable "vm_nic2_network_id" {
    description = "Network ID"
    type = string 
  
}

variable "vm_nic3_network_id" {
    description = "Network ID"
    type = string 
  
}

variable "template_network_interface_types" {

    description = "template_network_interface_types"
    type = string 
  
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
variable "vm_host_name" {

    description = "VM host name"
    type = string

}

variable "vm_domain_name" {

    description = "VM domain name"
    type = string

}

variable "disk_label" {

    description = "Disk label name"
    type = string

}

variable "template_disks_0_size" {

    description = "size of template's disk 0"
    type = string

}

variable "template_disks_0_thin_provisioned" {

    description = "disc provisioning type of the clone "
    type = string

}


variable "vm_nic_config" {
  description = "NICS_config: IP/Netmask etc."
  type        = list(
                    object({
                            ipv4_address   = string
                            ipv4_netmask     = string
                  
                    })
                )
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
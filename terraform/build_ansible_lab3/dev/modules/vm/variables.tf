variable "dc_name" {

    description = "Name of the DC"
    type = string

  
}

variable "vcenter_host_name" {

    description = "Host name of the Vcenter host"
    type = string
  
}

variable "vcenter_user_name" {

    description = "Name of the Admin accont who can creaet VMs"
    type = string
    sensitive = true
  
}

variable "vcneter_user_password" {

    description = "Password "
    type =  string
    sensitive = true

}

variable "vsphere_datastore_name" {

    description = "Name of the vshpere datastore where VM is parked"
    default =  "datastore2"


}

variable "vm_network_name" {
    description = "Name of the devfault virtual vsphere network"
    default = "VMNet-G1"
}

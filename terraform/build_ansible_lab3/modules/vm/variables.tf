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

variable "resource_pool" {
    description = "Name of the Vsphere resource pool"
    type = string
    default = "esxi-1.sriauronet.local/Resources"
  
}


variable "vsphere_datastore_name" {

    description = "Name of the vshpere datastore where VM is parked"
    type = string
    default =  "datastore2"


}

variable "vm_network_name" {
    description = "Name of the devfault virtual vsphere network"
    type = string
    default = "VMNet-G1"
}

variable "vm_template_name" {

    description = "Name of the VM template to clone from "
    type = string
    default = "userver-22.04-lts-template"
  
}

variable "vm_name" {

    description = "Name of the VM to be created"
    type = string
    default = "alab-controller1"
  
}

variable "vsphere_parent_folder_name" {

    description = "Name of the patent folder name"
    type = string

  
}

variable "vsphere_project_folder_name" {

    description = "Name of the Project folder name"
    type = string
  
}

variable "password" {

    description = "VM user password"
    type = string
    default = "Beauty!123"
    sensitive = true
  
}
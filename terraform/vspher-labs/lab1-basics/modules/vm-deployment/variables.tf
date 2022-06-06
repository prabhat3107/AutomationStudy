/* 
Module: vm-deployment
*/

variable "username" {
    default = "administrator@sriauronet.local"
}

variable "password" {
    default = "Beauty!123"
}

variable "vcenter" {
    default = "vcenter1.sriauronet.local"
}

variable "dc" {
    default = "SriAuronetHDC1"
 
}

variable "parent_folder" {
    default = "TFMLabs"
  
}

variable "resource_pool" {
    default = "esxi-1.sriauronet.local/Resources"
  
}

variable "datastore" {
    default =  "datastore2"
  
}

variable "vm_network" {

    default = "VMNet-G1"
}

variable "vm_template" {
  default = "ubuntu-server-t.sriauronet.local"
}


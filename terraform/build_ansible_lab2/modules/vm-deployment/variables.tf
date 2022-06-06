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
    default = "AnsibleLab-v2"
  
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

variable "vm_template_userver_22_04" {
  default = "userver-22.04-lts-template"
}

variable "vm_template_udesktop_22_04" {
  default = "udesktop-lts-22.04-template"
}

variable "vm_template_userver_20_04" {
  default = "userver-20.04-lts-template"
}

variable "vm_template_udesktop_20_04" {
  default = "udesktop-lts-20.04-template"
}


variable "vm_template_rhel8_5" {
  default = "rhel8.5-template"
}

variable "vm_template_cos_stream_8_5" {
  default = "centos-stream-8.5-template"
}




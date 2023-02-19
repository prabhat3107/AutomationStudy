//variable declartion 
// This module rquieres the following input variables 

variable "vsphere_datacenter_id" {

    description = "Vsphere Datacenter ID"
    type = string

  
}

variable "parent_project_folder_name" {

    description = "Parent Project folder name"
    type = string
  
}

variable "project_folder_name" {

    description = "Project folder name"
    type = string

}
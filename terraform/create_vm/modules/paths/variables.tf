
variable "vsphere_parent_folder_name" {

    description = "Name of the patent folder name"
    type = string

  
}

variable "vsphere_project_folder_name" {

    description = "Name of the Project folder name"
    type = string
  
}

variable "vsphere_datacenter_id" {

    description = "Datacenter ID to be provided to the Paths module"
    type = string
    sensitive = false
    
  
}
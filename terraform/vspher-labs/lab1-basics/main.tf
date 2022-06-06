terraform {
  required_providers{
      vsphere = {
          source = "hashicorp/vsphere"
          version = ">=2.0"
      }
  }
}

provider "vsphere" {
    user = var.username
    password = var.password
    vsphere_server = var.vcenter
    allow_unverified_ssl = true
  
}
/*
module "folderstructure" {

    source = "./modules/folder-structure"
  
}
*/

module "vmdeployment" {
    source = "./modules/vm-deployment"
}



/* 
Module : Folder Sructure
*/

 data "vsphere_datacenter" "dc" {
     name = var.dc
 }

 resource "vsphere_folder" "parent" {
     path = var.parent_folder
     type = "vm"
     datacenter_id = data.vsphere_datacenter.dc.id
   
 }

 resource "vsphere_folder" "Lab1-Basics" {
     path = "${vsphere_folder.parent.path}/Lab1-Basics"
     type = "vm"
     datacenter_id = data.vsphere_datacenter.dc.id
   
 }



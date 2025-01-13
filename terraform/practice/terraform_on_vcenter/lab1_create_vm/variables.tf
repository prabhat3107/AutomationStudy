variable "instance_type" {
  type = string                     # The type of the variable, in this case a string
  default = "t2.micro"                 # Default value for the variable
  description = "The type of EC2 instance" # Description of what this variable represents
}

variable "dc_name" {
  description = "Name of Vcenter DC"
  type = string
  default = "SriAuronetDC1"
}

variable "vcenter_host_name" {
  description = "The hostname for the VCenter Server adapter"
  type = string
  default = "vcenter1.sriauronet.lan"
}

variable "vcenter_user_name" {
  description = "The username for the vCenter Server adapter"
  type = string
  default = "administrator@sriauronet.lan"
}

variable "vcenter_user_password" {
  description = "The password for the vCenter Server adapter"
  type = string
  sensitive = true
  default = "Beauty!123"
}

variable "resource_pool" {
  description = "name of the vSphere resource pool for the vCenter Server adapter"
  type = string
  default = "/Resources/SriaPlugin"
}
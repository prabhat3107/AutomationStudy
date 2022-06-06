variable "proj_name" {

    description = "Name of the project"
    type = string
    default = "terrarom-larning"

}

variable "env_name" {

    description = "Name of the operation evnironment"
    type = string
    default = "uat"
  
}

variable "db_name" {

    description = "Name of the DB"
    type = string 
    sensitive = true
    default = "pbm_db"
    
}

variable "db_username" {
    description = "Name of the DB user"
    type = string
    sensitive = true
    default = "pbm_dba"
  
}

variable "db_password" {

    description = "DB pass"
    type = string
    sensitive = true
    default = "pbmdbapasswd"
  
}

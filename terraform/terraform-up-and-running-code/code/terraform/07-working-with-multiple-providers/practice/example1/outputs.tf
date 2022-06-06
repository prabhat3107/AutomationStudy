output "region_1" {

    value = data.aws_region.region_1.name
    description = "Name of the first region"
  
}

output "region_2" {

    value = data.aws_region.region_2.name
    description = "Name of the second region"
  
}

output "ami_ubnutu_20_04_region_1" {

    value = {
        name = data.aws_ami.ubuntu_20_04_region_1.name
        id = data.aws_ami.ubuntu_20_04_region_1.id
    }
    description = "Name of of the ami in us-east-1"
  
}

output "ami_ubnutu_20_04_region_2" {

    value = {
        name = data.aws_ami.ubuntu_20_04_region_2.name
        id = data.aws_ami.ubuntu_20_04_region_2.id
    }
    description = "Name of of the ami in us-east-2"
  
}

output "primary_address" {

    value = module.mysql_primary.address
    description = "Primary DB endpoint"  
}

output "primary_port" {

    value = module.mysql_primary.port
    description = "Primary DB port"
  
}

output "primary_arn" {

    value = module.mysql_primary.arn
    description = "Primary DB ARN"
}


output "replica_address" {

    value = module.mysql_replica.address
    description = "Replica DB endpoint"  
}


output "replica_port" {

    value = module.mysql_replica.port
    description = "Replica DB port"
  
}

output "replica_arn" {

    value = module.mysql_replica.arn
    description = "Replica DB ARN"
}





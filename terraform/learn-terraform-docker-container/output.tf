output "container_id" {
  description = "Id of the Docker container"
  value       = docker_container.nginx.id

}

output "image_id" {

  description = "Id of the Docker image"
  value       = docker_image.nginx.id

}

output "container_ip" {

  description = "IP address of the container"
  value       = docker_container.nginx.network_data.ip_address

}

output "container_internal_port" {
  description = "Internal listening port of the container"
  value       = docker_container.nginx.ports.internal

}

output "container_external_port" {
  description = "External listening port of the container"
  value       = docker_container.nginx.ports.external

}
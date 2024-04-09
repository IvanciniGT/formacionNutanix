output "direccion_ip" {
    value = docker_container.micontenedor.network_data[0].ip_address
}

# terraform output
# terraform output --raw direccion_ip
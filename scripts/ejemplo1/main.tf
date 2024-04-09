         # v Tipo recurso
                       # v id interno dentro del script
resource "docker_image" "miimagen" {
  name = "nginx:latest"
}
                            
resource "docker_container" "micontenedor" {
  name  = "contenedor1" # Nombre a nivel de docker
  image = docker_image.miimagen.image_id
}

# docker container create --name contenedor1 nginx:latest
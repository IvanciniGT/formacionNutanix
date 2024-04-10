
         # v Tipo recurso
                       # v id interno dentro del script
resource "docker_image" "miimagen" {
  name = var.imagen
}
# APPLY: docker image pull nginx:latest
# DESTROY: docker image rm nginx:latest
                            
resource "docker_container" "micontenedor" {
  name  = var.nombre # Nombre a nivel de docker
  image = docker_image.miimagen.image_id
  ports {
      internal = 80
      external = var.puerto
  }
}

# APPLY: docker container create --name contenedor1 -p 83:80 nginx:latest
# DESTROY: docker container rm contenedor1

# bash ---> playbooks de ansible

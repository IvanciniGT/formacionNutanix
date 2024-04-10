variable "nutanix_username" {
    description = "Usuario de Nutanix"
    type        = string
}

variable "nutanix_password" {
    description = "Contraseña de Nutanix"
    type        = string
}

variable "nutanix_endpoint" {
    description = "Endpoint de Nutanix"
    type        = string
}

variable "nutanix_port" {
    description = "Puerto de Nutanix"
    type        = number
}

variable "nutanix_insecure" {
    description = "Validar el certificado SSL de Nutanix Prism"
    type        = bool
}

variable "nutanix_cluster_id" {
    description = "ID del cluster de Nutanix"
    type        = string
}

variable "nutanix_subnet_name" {
    description = "Nombre de la subnet en Nutanix"
    type        = string
}

variable "image_url" {
    description = "URL de la imagen"
    type        = string
}

variable "image_name" {
    description = "Nombre de la imagen"
    type        = string
}

variable "image_description" {
    description = "Descripcion de la imagen"
    type        = string
}

variable "disk_size" {
    description = "Tamaño del disco en bytes"
    type        = number
}

variable "despliegue" {
    description = "Prefijo de despliegue"
    type        = string
}

variable vm_name {
    description = "Nombre de máquina virtual"
    type        = string
}
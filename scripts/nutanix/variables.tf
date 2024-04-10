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

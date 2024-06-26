terraform {
  required_providers {
    nutanix = {
      source = "nutanix/nutanix"
      version = "1.9.5"
    }
  }
}

provider "nutanix" {
    username     = var.nutanix_username
    password     = var.nutanix_password
    endpoint     = var.nutanix_endpoint
    port         = var.nutanix_port
    insecure     = var.nutanix_insecure
    wait_timeout = 10
}

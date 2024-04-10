data "nutanix_cluster" "cluster" {
  cluster_id = var.nutanix_cluster_id
}

data "nutanix_subnet" "subnet" {
  subnet_name = var.nutanix_subnet_name
}

resource "nutanix_image" "image" {
  name        = "${var.despliegue}${var.image_name}"
  description = var.image_description
  source_uri  = var.image_url
}

resource "nutanix_virtual_machine" "vm" {
  name = "${var.despliegue}${var.vm_name}"
  #cluster_uuid = var.nutanix_cluster_id # Sería muy muy mala práctica en terraform
  # Una variable solo debe aparecer en los fichero en uso 1 UNICA VEZ
  cluster_uuid = data.nutanix_cluster.cluster.cluster_id
  # ^ESTA SERIA LA BUENA PRACTICA: Fuerza dependencias entre recursos
  
  categories {
    name   = "Environment"
    value  = "Staging"
  }

  num_vcpus_per_socket = 1
  num_sockets          = 1
  memory_size_mib      = 2048
  
  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = nutanix_image.image.id
    }
  }

  disk_list {
    disk_size_bytes = var.disk_size
    device_properties {
      device_type = "DISK"
      disk_address = {
        "adapter_type" = "SCSI"
        "device_index" = "1"
      }
    }
  }
  
  nic_list {
    subnet_uuid = data.nutanix_subnet.subnet.id
  }
  
}

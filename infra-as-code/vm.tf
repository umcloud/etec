// Obtener una referencia a la imagen Ubuntu 22.04 LTS
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}

// Proveemos un template para startup script 
data "template_file" "nginx" {
  template = file("${path.module}/template/install_nginx.tpl")
}

// Crear la VM
resource "google_compute_instance" "vm_01" {
  name         = "vm-01"
  machine_type = "e2-micro"
  tags         = ["http"]


  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  metadata_startup_script = data.template_file.nginx.rendered
}


# modules/vm/main.tf
resource "google_compute_instance" "instance" {
  project      = var.project
  name         = "sample-instance-e2-micro"
  description  = ""
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20220118"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  metadata = {
    // OSログインを有効にする
    enable-oslogin = true
  }

  labels = {
    stage         = var.stage
    service_type = "web"
  }
}
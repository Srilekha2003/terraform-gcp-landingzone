resource "google_compute_instance" "frontend" {

  name = var.vm_name

  machine_type = "e2-micro"

  zone = var.zone

  tags = [
    "srilekha-frontend"
  ]

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-12"
    }
  }

  network_interface {

    subnetwork = var.subnet_id

    access_config {}
  }

  metadata_startup_script = file(
    "${path.module}/frontend-startup.sh"
  )

  service_account {

  email = var.service_account_email

  scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}

  labels = {

    environment = "dev"

    owner = "srilekha"

    managed_by = "terraform"
  }
}
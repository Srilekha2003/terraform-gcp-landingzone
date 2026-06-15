resource "google_compute_instance" "backend" {

  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  tags = [
    "srilekha-backend"
  ]

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-12"
    }
  }

  network_interface {

    subnetwork = var.subnet_id

    # NO access_config
    # This removes public IP
  }

  service_account {

    email = var.service_account_email

    scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  metadata_startup_script = <<-EOF
#!/bin/bash

apt-get update

apt-get install apache2 -y

systemctl enable apache2

systemctl start apache2

echo "Backend Server Running" > /var/www/html/index.html

EOF

}
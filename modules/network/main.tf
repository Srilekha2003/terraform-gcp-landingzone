locals {
  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "landing-zone"
  }
}
data "google_compute_network" "vpc" {
  name = var.vpc_name
}
resource "google_compute_subnetwork" "frontend" {

  name = "srilekha-frontend-subnet"

  ip_cidr_range = var.frontend_subnet_cidr

  region = var.region

  network = data.google_compute_network.vpc.id

  private_ip_google_access = true
}
resource "google_compute_subnetwork" "backend" {

  name = "srilekha-backend-subnet"

  ip_cidr_range = var.backend_subnet_cidr

  region = var.region

  network = data.google_compute_network.vpc.id

  private_ip_google_access = true
}
resource "google_compute_subnetwork" "database" {

  name = "srilekha-database-subnet"

  ip_cidr_range = var.database_subnet_cidr

  region = var.region

  network = data.google_compute_network.vpc.id

  private_ip_google_access = true
}
resource "google_compute_firewall" "frontend_web" {

  name = "srilekha-allow-http-https"

  network = data.google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["srilekha-frontend"]
}
resource "google_compute_firewall" "frontend_backend" {

  name = "srilekha-frontend-backend"

  network = data.google_compute_network.vpc.name

    allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_tags = ["srilekha-frontend"]

  target_tags = ["srilekha-backend"]
}
resource "google_compute_firewall" "backend_database" {

  name = "srilekha-backend-database"

  network = data.google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_tags = ["srilekha-backend"]

  target_tags = ["srilekha-database"]
}
resource "google_compute_global_address" "private_ip_range" {

  name = "srilekha-private-sql-range"

  purpose = "VPC_PEERING"

  address_type = "INTERNAL"

  prefix_length = 16

  network = data.google_compute_network.vpc.id
}
resource "google_service_networking_connection" "private_vpc_connection" {

  network = data.google_compute_network.vpc.id

  service = "servicenetworking.googleapis.com"

  reserved_peering_ranges = [
    google_compute_global_address.private_ip_range.name
  ]
}
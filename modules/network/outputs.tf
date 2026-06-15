output "frontend_subnet" {
  value = google_compute_subnetwork.frontend.id
}

output "backend_subnet" {
  value = google_compute_subnetwork.backend.id
}

output "database_subnet" {
  value = google_compute_subnetwork.database.id
}
output "private_service_connection" {
  value = google_service_networking_connection.private_vpc_connection.id
}
output "vpc_id" {
  value = data.google_compute_network.vpc.id
}
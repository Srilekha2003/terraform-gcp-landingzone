output "backend_vm_name" {
  value = google_compute_instance.backend.name
}

output "backend_private_ip" {
  value = google_compute_instance.backend.network_interface[0].network_ip
}
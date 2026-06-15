output "frontend_vm_name" {

  value = google_compute_instance.frontend.name
}

output "frontend_public_ip" {

  value = google_compute_instance.frontend.network_interface[0].access_config[0].nat_ip
}

output "frontend_private_ip" {

  value = google_compute_instance.frontend.network_interface[0].network_ip
}
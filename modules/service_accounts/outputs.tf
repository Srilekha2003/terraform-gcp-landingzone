output "frontend_sa_email" {
  value = google_service_account.frontend_sa.email
}

output "backend_sa_email" {
  value = google_service_account.backend_sa.email
}

output "database_sa_email" {
  value = google_service_account.database_sa.email
}
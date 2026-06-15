resource "google_service_account" "frontend_sa" {

  account_id   = "srilekha-frontend-sa"
  display_name = "Frontend Service Account"
}

resource "google_service_account" "backend_sa" {

  account_id   = "srilekha-backend-sa"
  display_name = "Backend Service Account"
}

resource "google_service_account" "database_sa" {

  account_id   = "srilekha-database-sa"
  display_name = "Database Service Account"
}
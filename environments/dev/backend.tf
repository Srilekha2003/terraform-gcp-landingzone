terraform {
  backend "gcs" {
    bucket = "srilekha-tf-state-lz"
    prefix = "terraform-gcp-landingzone/environments/dev"
  }
}
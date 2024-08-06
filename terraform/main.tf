provider "google" {
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "terraform_state" {
  project  = var.project
  location = var.location_bucket
  name     = var.name_bucket_terraform
}
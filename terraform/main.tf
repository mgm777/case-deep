provider "google" {
  project = var.project
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "deep-infra"
    prefix = "terraform/state/prd"
    
  }
}
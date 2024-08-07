provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "deep-infra"
    prefix = "terraform/state/prd"
    
  }
}
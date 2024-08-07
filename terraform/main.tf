
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.40.0"
    }
  }
  backend "gcs" {
    bucket = "deep-infra"
    prefix = "terraform/state"

  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}


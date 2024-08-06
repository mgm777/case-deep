terraform {
  backend "gcs" {
    bucket = "terraform-deep"
    prefix = "terraform/state/prd"
  }
}
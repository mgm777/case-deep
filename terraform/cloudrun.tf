resource "google_cloud_run_v2_service" "frontend" {
  name     = var.cloudrun_name_front
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image_front
      resources {
        limits = {
          cpu    = "1"
          memory = "1024Mi"
        }
      }
    }
  }
  depends_on = [ google_artifact_registry_repository.front_repo_image ]
}

resource "google_cloud_run_v2_service" "backend" {
  name     = var.cloudrun_name_back
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image_back
      resources {
        limits = {
          cpu    = "1"
          memory = "1024Mi"
        }
      }
    }
  }
  depends_on = [ google_artifact_registry_repository.back_repo_image ]
}
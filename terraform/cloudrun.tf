resource "google_cloud_run_v2_service" "frontend" {
  name     = var.cloudrun_name_front
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image_front
      name = var.container_name_front
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

resource "google_cloud_run_service_iam_member" "_cloudrun" {
  service  = google_cloud_run_v2_service.frontend.name
  location = google_cloud_run_v2_service.frontend.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_v2_service" "backend" {
  name     = var.cloudrun_name_back
  location = var.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.image_back
      name = var.container_name_back
      ports {
          container_port = 5500
        }
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
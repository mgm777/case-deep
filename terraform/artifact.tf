resource "google_artifact_registry_repository" "front_repo_image" {
  location      = var.location
  repository_id = var.front_repo_name
  description   = "Repositório de imagens frontend"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "back_repo_image" {
  location      = var.location
  repository_id = var.back_repo_name
  description   = "Repositório de imagens backend"
  format        = "DOCKER"
}


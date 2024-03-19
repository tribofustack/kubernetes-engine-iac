resource "google_artifact_registry_repository" "repository" {
  location      = var.region
  repository_id = "repository"
  description   = ""
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}


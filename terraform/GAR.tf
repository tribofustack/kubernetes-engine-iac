/* 
Google Artifact Registry
*/

resource "google_artifact_registry_repository" "repository" {
  location      = "us-central1"
  repository_id = "docker-images-rep"
  description   = "example docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}

/* Output */
output "docker_repository" {
  value = google_artifact_registry_repository.repository
}


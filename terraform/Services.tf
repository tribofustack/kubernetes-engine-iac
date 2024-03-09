resource "google_project_service" "enable_artifact_registry_api" {
  service                    = "artifactregistry.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_cloud_resource_manager_api" {
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_container_api" {
  service                    = "container.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_servicecontrol_api" {
  service                    = "servicecontrol.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_networksecurity_api" {
  service                    = "networksecurity.googleapis.com"
  disable_dependent_services = true
}
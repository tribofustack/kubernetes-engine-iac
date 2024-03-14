resource "google_project_service" "enable_artifact_registry_api" {
  project                    = var.project_id
  service                    = "artifactregistry.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_cloud_resource_manager_api" {
  project                    = var.project_id
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_container_api" {
  project                    = var.project_id
  service                    = "container.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_servicecontrol_api" {
  project                    = var.project_id
  service                    = "servicecontrol.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_networksecurity_api" {
  
  service                    = "networksecurity.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_sqladmin_api" {
  service                    = "sqladmin.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_apigateway_api" {
  service                    = "apigateway.googleapis.com"
  disable_dependent_services = true
}
terraform {
  required_version = ">= 0.13"
  required_providers {
    google = ">= 5.17.0"
  }
}
provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
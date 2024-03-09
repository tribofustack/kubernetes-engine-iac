# Create a VPC network
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-${var.zone}-vpc"
  auto_create_subnetworks = false
  description             = "Orderly VPC"
  routing_mode            = "REGIONAL"
  project                 = var.project_id

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-${var.zone}-subnet"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}

resource "google_compute_router" "router" {
  name    = "${var.prefix}-${var.zone}-router"
  region  = google_compute_subnetwork.subnet.region
  network = google_compute_network.vpc.id

  bgp {
    asn = 64514
  }

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.project_id}-${var.zone}-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}
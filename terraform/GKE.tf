/* 
GKE cluster
*/

/* Create Service Account and IAM Member */
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_project_iam_member" "allow_image_pull" {
  project = var.project_id
  role   = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

/* Create Cluster and Node*/
resource "google_container_cluster" "primary" {
  name     = "${var.prefix}-${var.project_id}-gke"
  location = var.zone
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}

resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  
  node_count = 2

  node_config {
    service_account = google_service_account.kubernetes.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/sqlservice.admin",
    ]

    labels = {
      env = var.project_id
    }

    machine_type = "e2-medium"
    tags         = ["gke-node", "${var.prefix}-${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }    
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
output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "cluster_ip" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}
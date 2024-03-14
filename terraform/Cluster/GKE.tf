/* Create Service Account and IAM Member */

/* Create Cluster and Node*/
resource "google_container_cluster" "primary" {
  name     = "${var.prefix}-${var.project_id}-gke"
  location = var.zone
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count       = 4

  network    = var.network_link
  subnetwork = var.subnetwork_link
}

resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  
  node_count = 4

  node_config {
    service_account = var.email

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
}
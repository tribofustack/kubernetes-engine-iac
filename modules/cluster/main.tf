resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.zone
  deletion_protection      = false
  initial_node_count       = 1
  network                  = var.network_link
  subnetwork               = var.subnetwork_link
  remove_default_node_pool = true
  project                  = var.project_id
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1
  node_config {
    # preemptible  = true
    machine_type = var.machine_type
    image_type   = var.image_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "google_client_config" "provider" {}

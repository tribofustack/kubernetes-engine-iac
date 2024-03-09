output "network_link" {
  value = google_compute_network.vpc.self_link
}

output "subnetwork_link" {
  value = google_compute_subnetwork.subnetwork.self_link
}
module "registry" {
  source     = "./modules/registry"
  project_id = var.project_id
  region     = var.region
  prefix     = var.prefix

  depends_on = [
    google_project_service.artifactregistry,
    google_project_service.networksecurity,
    google_project_service.cloudresourcemanager,
    google_project_service.compute,
    google_project_service.container,
    google_project_service.servicecontrol
  ]
}

module "vpc" {
  source = "./modules/vpc"
  depends_on = [module.registry]
  network_name = var.network_name
  project_id   = var.project_id
  region       = var.region
}

module "cluster" {
  source = "./modules/cluster"

  depends_on = [module.vpc]

  network_link    = module.vpc.network_link
  subnetwork_link = module.vpc.subnetwork_link
  project_id      = var.project_id
  zone            = var.zone
  cluster_name    = var.cluster_name
  machine_type    = var.machine_type
  image_type      = var.image_type
  disk_size_gb    = var.disk_size_gb
  disk_type       = var.disk_type
}

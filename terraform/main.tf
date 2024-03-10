module "registry" {
  source     = "./Registry"
  project_id = var.project_id
  region     = var.region
  prefix     = var.prefix

  depends_on = [
    google_project_service.enable_artifact_registry_api,
    google_project_service.enable_cloud_resource_manager_api,
    google_project_service.enable_container_api,
    google_project_service.enable_servicecontrol_api,
    google_project_service.enable_networksecurity_api
  ]
}
module "vpc" {
  source     = "./VPC"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
  depends_on = [module.registry]
}
module "cluster" {
  source          = "./Cluster"
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  prefix          = var.prefix
  email           = var.email
  network_link    = module.vpc.network_link
  subnetwork_link = module.vpc.subnetwork_link
  depends_on      = [module.vpc]
}
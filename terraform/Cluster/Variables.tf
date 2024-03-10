variable "region" {
  type    = string
}

variable "zone" {
  type    = string
}

variable "prefix" {
  type    = string
}

variable "project_id" {
  type    = string
}

variable "network_link" {
  type    = string
}

variable "subnetwork_link" {
  type    = string
}

variable "email" {
  type    = string
  default = "github-actions-user@orderly-developer-environment.iam.gserviceaccount.com"
}
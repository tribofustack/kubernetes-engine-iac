terraform {
  required_version = ">= 0.13"
  required_providers {
    google = ">= 5.17.0"
    local  = ">= 2.4.1"
  }
  backend "gcs" {
    /* 
    bucket and prefix will be passed in terraform init command
    bucket = ""
    prefix = ""
    */
  }
}
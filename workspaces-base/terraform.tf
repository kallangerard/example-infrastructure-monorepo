terraform {
  required_providers {
    tfe = {
      version = "~> 0.43.0"
    }
  }
}

locals {
  project_id = "prj-X27rr8hHEbgEwczb"
}

provider "tfe_organization" "this" {
  name = "kallangerard"
}

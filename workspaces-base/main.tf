locals {
  project_id                 = "prj-X27rr8hHEbgEwczb"
  vcs_repo_identifier        = "kallangerard/example-infrastructure-monorepo"
  github_app_installation_id = var.github_app_installation_id
}

data "tfe_organization" "this" {
  name = "kallangerard"
}


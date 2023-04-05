locals {
  project_id          = "prj-X27rr8hHEbgEwczb"
  vcs_repo_identifier = "kallangerard/example-infrastructure-monorepo"
}


data "tfe_organization" "this" {
  name = "kallangerard"
}

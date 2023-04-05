locals {
  workspace_yaml_files = fileset("../workspaces/", "*/workspace.yaml")
  workspace_yaml_config = {
    for file in local.workspace_yaml_files :
    file => yamldecode(file("../workspaces/${file}"))
  }
  workspace_config = {
    for file, config in local.workspace_yaml_config :
    regex("(.*)/workspace.yaml$", file)[0] => config
  }
}

resource "tfe_workspace" "this" {
  for_each          = local.workspace_config
  name              = each.key
  auto_apply        = lookup(each.value, "auto_apply", null)
  tag_names         = lookup(each.value, "tags", null)
  project_id        = local.project_id
  working_directory = "workspaces/${each.key}"
  trigger_patterns = [
    "workspaces/${each.key}/**/*",
    "**/stack-v*/**/*"
  ]
  # vcs_repo {
  #   github_app_installation_id = var.github_app_installation_id
  #   identifier                 = local.vcs_repo_identifier
  # }
}

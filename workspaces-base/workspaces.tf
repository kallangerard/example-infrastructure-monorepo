locals {
  workspace_yaml_files = fileset("../workspaces/", "*/workspace.yaml")
  workspace_yaml_config = {
    for file in local.workspace_yaml_files :
    file => yamldecode(file(file))
  }
  workspace_config = {
    for file, config in local.workspace_yaml_config :
    regex("^.*/(.*)/workspace.yaml$", file)[0] => config
  }
}

resource "tfe_workspace" "this" {
  for_each          = local.workspace_config
  name              = each.key
  tags              = each.value.tags
  working_directory = "workspaces/${each.key}"
  trigger_patterns = [
    "workspaces/${each.key}/**/*",
    "**/stack-v*/**/*"
  ]
}

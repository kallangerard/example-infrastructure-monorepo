data "terraform_remote_state" "data" {
  backend = "local"
  config = {
    path = "../uat-data"
  }
}

data "terraform_remote_state" "access" {
  backend = "local"
  config = {
    path = "../uat-access"
  }
}

locals {
  application_database_name = data.terraform_remote_state.data.application_database_name
  application_role_username = data.terraform_remote_state.access.application_role_name
  application_role_password = data.terraform_remote_state.access.application_password

  database_connection_string = "postgresql://${local.application_role_username}:${local.application_role_password}@${local.postgres_host}:${local.postgres_port}/${local.application_database_name}"
}


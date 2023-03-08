data "terraform_remote_state" "data" {
  backend = "local"
  config = {
    path = "../uat-data"
  }
}

locals {
  application_database_name = data.terraform_remote_state.data.application_database_name
}


module "stack" {
  source = "../../stack/v1"

  application_role_password = "YXBwbGljYXRpb24K"
}

provider "postgresql" {
  host            = "localhost"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}



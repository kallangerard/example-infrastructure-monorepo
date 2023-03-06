provider "postgresql" {
  host            = "postgres"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "require"
  connect_timeout = 15
}

terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.17"
    }
  }
}

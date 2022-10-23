resource "postgresql_role" "application_role" {
  name     = "application"
  login    = true
  password = var.application_role_password
}

resource "postgresql_database" "application_database" {
  name              = "application"
  owner             = "application"
  connection_limit  = -1
  allow_connections = true
}

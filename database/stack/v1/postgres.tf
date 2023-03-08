resource "postgresql_database" "todo" {
  name              = "todo"
  owner             = "postgres"
  connection_limit  = -1
  allow_connections = true
}

resource "postgresql_role" "todo_application" {
  name     = "todo_application"
  login    = true
  password = var.application_role_password
}

resource "postgresql_grant" "todo_application" {
  role              = "todo_application"
  database          = "todo"
  privileges        = ["ALL"]
  object_type       = "database"
  with_grant_option = true
}

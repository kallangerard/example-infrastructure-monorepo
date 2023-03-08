resource "random_password" "todo_application" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "postgresql_role" "todo_application" {
  name     = "todo_application"
  login    = true
  password = random_password.todo_application.result
}

resource "postgresql_grant" "database_to_todo_application" {
  role              = postgresql_role.todo_application.name
  database          = var.application_database_name
  privileges        = ["CONNECT", "CREATE"]
  object_type       = "database"
  with_grant_option = true
}

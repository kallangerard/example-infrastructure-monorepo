resource "postgresql_database" "todo" {
  name              = "todo"
  owner             = "postgres"
  connection_limit  = -1
  allow_connections = true
}

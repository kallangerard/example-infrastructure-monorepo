locals {
  postgres_host = "localhost"
  postgres_port = 5432

  application_database_name = module.data_stack.database.name
  application_role_username = module.access_stack.application_role.name
  application_role_password = module.access_stack.application_role_password

  database_connection_string = "postgresql://${local.application_role_username}:${local.application_role_password}@${local.postgres_host}:${local.postgres_port}/${local.application_database_name}?sslmode=disable"
}


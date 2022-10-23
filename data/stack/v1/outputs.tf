output "application_role_valid_until" {
  value = postgresql_role.application_role.valid_until
}

output "application_database_name" {
  value = postgresql_database.application_database.id
}

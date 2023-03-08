output "application_role_valid_until" {
  value = postgresql_role.todo_application.valid_until
}

output "application_database_name" {
  value = postgresql_database.todo.id
}

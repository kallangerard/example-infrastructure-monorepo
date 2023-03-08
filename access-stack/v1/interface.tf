variable "application_database_name" {
  type = string
}


output "application_role" {
  value = { for key in ["name", "id", "valid_until"] : key => postgresql_role.todo_application[key] }
}

output "application_role_password" {
  value     = postgresql_role.todo_application.password
  sensitive = true
}

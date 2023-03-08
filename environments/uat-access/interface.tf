output "application_role_name" {
  value = module.access_stack.application_role.name
}

output "application_role_password" {
  value     = module.access_stack.application_role_password
  sensitive = true
}

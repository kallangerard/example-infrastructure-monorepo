variable "application_role_password" {
  type      = string
  sensitive = true
  validation {
    condition     = length(var.application_role_password) >= 16
    error_message = "The application_role_password value must be at least 16 characters long."
  }
}

variable "namespace" {
  description = "Namespace of the stack"
  type        = string
}

output "output_file" {
  value = local_file.this.filename
}

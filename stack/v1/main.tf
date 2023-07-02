resource "local_file" "this" {
  content  = "This is a file created for ${var.namespace}"
  filename = "${path.root}/../../${var.namespace}.txt"
}

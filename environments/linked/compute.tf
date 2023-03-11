module "compute_stack" {
  source = "../../compute-stack/v1"

  database_connection_string = local.database_connection_string
}

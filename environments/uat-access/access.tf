module "access_stack" {
  source                    = "../../access-stack/v1"
  application_database_name = local.application_database_name
}

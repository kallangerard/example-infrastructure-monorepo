provider "postgresql" {

  host            = local.postgres_host
  port            = local.postgres_port
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}

provider "postgresql" {
  host            = "postgres"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "require"
  connect_timeout = 15
}

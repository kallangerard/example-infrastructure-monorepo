output "database" {
  value = {
    for key in ["name", ] : key => postgresql_database.todo[key]
  }
}

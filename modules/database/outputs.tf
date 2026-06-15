output "db_instance_name" {

  value = google_sql_database_instance.mysql.name
}

output "db_connection_name" {

  value = google_sql_database_instance.mysql.connection_name
}

output "db_public_ip" {

  value = google_sql_database_instance.mysql.public_ip_address
}
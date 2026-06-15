resource "google_sql_database_instance" "mysql" {

  name = var.db_instance_name

  database_version = "MYSQL_8_0"

  region = var.region

  deletion_protection = false

  depends_on = [
    var.private_service_connection
  ]

  settings {

    tier = "db-f1-micro"

    disk_type = "PD_SSD"

    disk_size = 10

    backup_configuration {
      enabled = true
    }

    ip_configuration {

      ipv4_enabled = false

      private_network = var.network_id
    }
  }
}
resource "google_sql_database" "appdb" {

  name = var.db_name

  instance = google_sql_database_instance.mysql.name
}
resource "google_sql_user" "appuser" {

  name = var.db_user

  instance = google_sql_database_instance.mysql.name

  password = var.db_password
}
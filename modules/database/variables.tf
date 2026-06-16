variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "db_instance_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "network_id" {
  type = string
}

variable "private_service_connection" {
  type = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  
}
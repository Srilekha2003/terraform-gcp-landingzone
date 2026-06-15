variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Deployment region"
  type        = string
}

variable "zone" {
  description = "Deployment zone"
  type        = string
}

variable "vpc_name" {
  description = "Existing VPC"
  type        = string
}

variable "frontend_subnet_cidr" {
  type = string
}

variable "backend_subnet_cidr" {
  type = string
}

variable "database_subnet_cidr" {
  type = string
}

variable "environment" {
  type = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
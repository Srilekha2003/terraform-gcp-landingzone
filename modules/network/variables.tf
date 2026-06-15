variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "vpc_name" {
  description = "Existing VPC name"
  type        = string
}

variable "frontend_subnet_cidr" {
  description = "Frontend subnet CIDR"
  type        = string
}

variable "backend_subnet_cidr" {
  description = "Backend subnet CIDR"
  type        = string
}

variable "database_subnet_cidr" {
  description = "Database subnet CIDR"
  type        = string
}

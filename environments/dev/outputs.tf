output "frontend_vm_name" {
  value = module.frontend.frontend_vm_name
}

output "backend_vm_name" {
  value = module.backend.backend_vm_name
}

output "database_instance_name" {
  value = module.database.db_instance_name
}

output "frontend_public_ip" {
  value = module.frontend.frontend_public_ip
}

output "backend_private_ip" {
  value = module.backend.backend_private_ip
}

output "database_connection_name" {
  value = module.database.db_connection_name
}
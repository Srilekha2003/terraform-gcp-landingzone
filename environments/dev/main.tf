module "network" {

  source = "../../modules/network"

  project_id = var.project_id

  region = var.region

  environment = "dev"

  vpc_name = var.vpc_name

  frontend_subnet_cidr = var.frontend_subnet_cidr

  backend_subnet_cidr = var.backend_subnet_cidr

  database_subnet_cidr = var.database_subnet_cidr

}

module "service_accounts" {

  source = "../../modules/service_accounts"

  project_id = var.project_id
}

module "frontend" {

  source = "../../modules/frontend"

  project_id = var.project_id

  region = var.region

  zone = var.zone

  subnet_id = module.network.frontend_subnet

  vm_name = "srilekha-frontend-vm"

  service_account_email = module.service_accounts.frontend_sa_email
}
module "backend" {

  source = "../../modules/backend"

  project_id = var.project_id

  region = var.region

  zone = var.zone

  subnet_id = module.network.backend_subnet

  vm_name = "srilekha-backend-vm"

  service_account_email = module.service_accounts.backend_sa_email
}
module "database" {

  source = "../../modules/database"

  project_id = var.project_id

  region = var.region

  db_instance_name = "srilekha-mysql"

  db_name = "appdb"

  db_user = "appuser"

  db_password = random_password.db.result

  network_id = module.network.vpc_id

  private_service_connection = module.network.private_service_connection
}
terraform { 
	cloud { 	    
	    organization = "terraform-test-1-icorujo" 
	    workspaces { 
	      name = "terraform-proyecto-infra-web" 
	    } 
	} 
}

module "network" {
  source = "./modules/network"
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  aws_region = var.aws_region
}

module "compute" {
  source = "./modules/compute"
  environment = var.environment
  subnet_id = module.network.public_subnet_id
  subnet_b_id = module.network.public_subnet_b_id
  instance_type = var.instance_type
  vpc_id = module.network.vpc_id
}

module "database" {
  source = "./modules/database"
  environment = var.environment
  subnet_id = module.network.public_subnet_id
  subnet_b_id = module.network.public_subnet_b_id
  db_identifier = var.db_identifier
  db_username   = var.db_username
  db_password   = var.db_password
}
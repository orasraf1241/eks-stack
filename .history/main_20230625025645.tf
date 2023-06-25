provider "aws" {
  region = "us-east-1"
}

module "vpc_module" {
  source                 = "./modules/vpc"
  region         = var.region
  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr

  ### EKS Configuration ###
  cluster_name            = var.cluster_name
  min_node_size           = var.min_node_size
  max_node_size           = var.max_node_size
  



}
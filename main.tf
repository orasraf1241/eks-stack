provider "aws" {
  region = "us-east-1"
}

module "vpc_module" {
  source                 = "./modules/vpc"
  region         = var.region

  ### EKS Configuration ###

  cluster_name            = var.cluster_name
  min_node_size           = var.min_node_size
  max_node_size           = var.max_node_size
  



  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr

  public_subnets = [
    {
      cidr_block         = "10.0.1.0/24"
      availability_zone  = "us-east-1a"
      map_public_ip      = true
      name               = "Public Subnet 1"
    },
    {
      cidr_block         = "10.0.2.0/24"
      availability_zone  = "us-east-1b"
      map_public_ip      = true
      name               = "Public Subnet 2"
    },
  ]
  private_subnets = [
    {
      cidr_block         = "10.0.3.0/24"
      availability_zone  = "us-east-1a"
      name               = "Private Subnet 1"
    },
    {
      cidr_block         = "10.0.4.0/24"
      availability_zone  = "us-east-1b"
      name               = "Private Subnet 2"
    },
  ]  
}
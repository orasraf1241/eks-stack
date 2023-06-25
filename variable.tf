

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "AWS region"
  type        = string
  default     = "asraf_vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
#######################################################
##
##                  Creatin subnets
##
#######################################################

# variable "subnet" {
#   description = "Information for creating a subnet"
#   type = object({
#     vpc_id                  = string
#     cidr_block              = string
#     availability_zone       = string
#     map_public_ip_on_launch = bool
#     name                    = string
#   })
#   default = {
#     vpc_id                  = "" // Your VPC ID
#     cidr_block              = "" // Your CIDR block
#     availability_zone       = "" // Your availability zone
#     map_public_ip_on_launch = true
#     name                    = "Public Subnet 1"
#   }
# }


variable "public_subnets" {
  type = list(object({
    cidr_block         = string
    availability_zone  = string
    map_public_ip      = bool
    name               = string
  }))

  default = [
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
}

variable "private_subnets" {
  type = list(object({
    cidr_block         = string
    availability_zone  = string
    name               = string
  }))

  default = [
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

variable "availability_zone_1" {
  description = "Availability Zone for  subnet 1"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for  subnet 2"
  type        = string
  default     = "us-east-1b"
}

#######################################################
##
##                 NAT & IGW & RT
##
#######################################################

variable "igw" {
  description = "name of the igw"
  type = string
  default = "Internt_gateWay"
}

variable "nat_gateway_1" {
  description = "name of the nat gateway 1"
  type = string
  default = "nat_gateway_1"
  
}

variable "nat_gateway_2" {
  description = "name of the nat gateway 2"
  type = string
  default = "nat_gateway_2"
  
}

variable "elastic_ip1" {
  description = "name of the nat ip 1"
  type = string
  default = "nat-ip-1"
  
}

variable "elastic_ip2" {
  description = "name of the nat ip 2"
  type = string
  default = "nat-ip-2"
  
}

variable "sg_description_application_load_balancer" {
  description = "name of the sg of alb"
  type = string
  default = "alb-sg"
  
}
 
variable "sg_application_load_balancer" {
  description = "description for sg of alb"
  type = string
  default = "allow httpd"
  
}

########## EKS ###########
variable "cluster_name" {
  description = "name of the cluster"
  type = string
  default = "asraf-cluster"
}

variable "node_group" {
  description = "name of the cluster"
  type = string
  default = "eks-node-group"
}



variable "prometheus-namespace" {
  type    = string
  default = "monitoring"
}

variable "min_node_size" {
  description = "min node for eks cluster"
  type = number
  default = 2
}

variable "max_node_size" {
  description = "max node for eks cluster"
  type = number
  default = 4
}
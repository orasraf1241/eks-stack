region = "us-east-1"
vpc_name = "asraf_vpc2"
vpc_cidr = "10.0.0.0/16"

public_subnets = [
  {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip     = true
    name              = "Public Subnet 1"
  },
  {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip     = true
    name              = "Public Subnet 2"
  },
]

private_subnets = [
  {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    name              = "Private Subnet 1"
  },
  {
    cidr_block        = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    name              = "Private Subnet 2"
  },
]

availability_zone_1 = "us-east-1a"
availability_zone_2 = "us-east-1b"

igw = "Internt_gateWay"

nat_gateway_1 = "nat_gateway_1"
nat_gateway_2 = "nat_gateway_2"

elastic_ip1 = "nat-ip-1"
elastic_ip2 = "nat-ip-2"

sg_description_application_load_balancer = "alb-sg"
sg_application_load_balancer = "allow httpd"

cluster_name = "asraf2-cluster"

prometheus-namespace = "monitoring"

min_node_size = 2
max_node_size = 4

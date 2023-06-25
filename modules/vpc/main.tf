#######################################################
##
##                  global variables
##
#######################################################

provider "aws" {
  region = var.region
}

#### VPC SECTION ######
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

#######################################################
##
##                  subnets
##
#######################################################

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnets[count.index].cidr_block
  availability_zone       = var.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.public_subnets[count.index].map_public_ip

  tags = {
    Name = var.public_subnets[count.index].name
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnets[count.index].cidr_block
  availability_zone       = var.private_subnets[count.index].availability_zone

  tags = {
    Name = var.private_subnets[count.index].name
  }
}

#######################################################
##
##                 NAT & IGW & RT
##
#######################################################

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_associations" {
  count             = length(var.public_subnets)
  subnet_id         = aws_subnet.public_subnet[count.index].id
  route_table_id    = aws_route_table.public_route_table.id

  depends_on = [
    aws_internet_gateway.my_igw,
    aws_subnet.public_subnet,
    aws_route_table.public_route_table
  ]
}

resource "aws_route_table_association" "private_subnet_associations" {
  count             = length(var.private_subnets)
  subnet_id         = aws_subnet.private_subnet[count.index].id
  route_table_id    = aws_route_table.private_route_table.id

  depends_on = [
    aws_subnet.private_subnet,
    aws_route_table.private_route_table
  ]
}

resource "aws_nat_gateway" "nat_gateway" {
  count          = length(var.public_subnets)
  allocation_id  = aws_eip.nat_eip[count.index].id
  subnet_id      = aws_subnet.public_subnet[count.index].id

  tags = {
    Name = "NAT Gateway ${count.index + 1}"
  }
}

resource "aws_eip" "nat_eip" {
  count = length(var.public_subnets)
  domain = "vpc"
}

#######################################################
##
##                  Security Group
##
#######################################################

resource "aws_security_group" "alb" {
  name        = var.sg_application_load_balancer
  description = var.sg_description_application_load_balancer
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_application_load_balancer
  }
}

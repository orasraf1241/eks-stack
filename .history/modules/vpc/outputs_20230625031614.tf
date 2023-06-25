# output "vpc_id" {
#   description = "vpc id "
#   value       = aws_vpc.main.id
# }

# output "public_subnets" {
#   description = "The id of the public subnets"
#   value       = [for s in aws_subnet.subnet : s.id if s.tags["Type"] == "public"]
# }

# output "private_subnets" {
#   description = "The id of the private subnets"
#   value       = [for s in aws_subnet.subnet : s.id if s.tags["Type"] == "private"]
# }


# output "nat_gateways" {
#   description = "The id of the NAT gateways"
#   value       = [aws_nat_gateway.nat1.id, aws_nat_gateway.nat2.id]
# }


output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}


output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet[0].id,
    aws_subnet.public_subnet[1].id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet[0].id,
    aws_subnet.private_subnet[1].id
  ]
}

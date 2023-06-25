output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}


output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "security_group_id" {
  value = aws_security_group.alb.id
}

output "vpc_id" {
  value       = aws_vpc.my_vpc.id
}




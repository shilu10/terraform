output "public_subnets" {
  description = "public_subnet"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "private subnet"
  value       = aws_subnet.private[*].id
}

output "main_vpc" {
  description = "this is the main vpc"
  value       = aws_vpc.main_vpc[0].id
}

output "public_route_table_association" {
  description = "need to provide a subnets that are needed have a public internet access"
  value       = aws_route_table_association.public_route_table_association[*].id
}
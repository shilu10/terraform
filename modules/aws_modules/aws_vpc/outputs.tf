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

output "private_route_table_association" {
  description = "need to provide a subnets that are needed have a public internet access"
  value       = aws_route_table_association.private_route_table_association[*].id
}

output "sg" {
  description = "for creating a non-default security group rules"
  value       = aws_security_group.sg.id
}

output "public_inbound_acl_rules" {
  description = "for the additional public inbound network acl rules"
  value       = aws_network_acl_rule.public_inbound[*].id
}

output "public_outbound_acl_rules" {
  description = "for the additional public outbound network acl rules"
  value       = aws_network_acl_rule.public_outbound[*].id
}

output "private_inbound_acl_rules" {
  description = "for the additional private inbound network acl rules"
  value       = aws_network_acl_rule.private_inbound[*].id
}

output "private_outbound_acl_rules" {
  description = "for the additional private outbound network acl rules"
  value       = aws_network_acl_rule.private_outbound[*].id
}
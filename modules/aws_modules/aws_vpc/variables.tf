variable "public_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the public subnets"
}

variable "public_subnets" {
  type        = list(string)
  default     = []
  description = "Please provide a list of subnet with their subnet mask"
}

variable "private_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the private subnets"
}

variable "private_subnets" {
  type        = list(string)
  default     = []
  description = "Please provide a list of subnet with their subnet mask"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "azs" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block" {
  type    = string
  default = ""
}

variable "enable_public_route" {
  type    = bool
  default = false
}

variable "enable_public_ip" {
  type    = list(bool)
  default = []
}

variable "enable_nat" {
  type    = string
  default = false
}

variable "assign_private_ipv6" {
  type    = list(string)
  default = []
}

variable "assign_public_ipv6" {
  type    = list(string)
  default = []
}

variable "enable_ipv6" {
  type    = string
  default = false
}

variable "public_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(string)
  default     = []
}

variable "private_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(string)
  default     = []
}

variable "assign_ipv6_address_on_creation" {
  type    = bool
  default = false
}

variable "manage_default_security_group" {
  type    = bool
  default = false
}

variable "create_vpc" {
  type    = bool
  default = false
}

variable "ingress_security_group_rules" {
  type = list(map(string))
  default = [{

  }]
}

variable "egress_security_group_rules" {
  type = list(map(string))
  default = [{

  }]
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "Allows user to have a single nat gateway for all of their subnets"
}

variable "nat_gateway_for_each_subnet" {
  type        = bool
  default     = false
  description = "Allows users to have one gateway for eahc subnet their created"
}

variable "manage_default_network_acl" {
  type        = bool
  default     = false
  description = "To manage a default network access control list for all of the subnets"
}

variable "default_ingress_nacl_rules" {
  type        =  list(map(string))
  default     = [{}]
  description = "this is used to maintain a default network access list rules"
}

variable "default_egress_nacl_rules" {
  type        =   list(map(string))
  default     = [{}]
  description = "this is used to maintain a default network access list rules"
}

variable "create_inbound_sg_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "This is used to create a new ingress security group rules, which is non-default."
}

variable "create_outbound_sg_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "This is used to create a new egress security group rules, which is non-default."
}

variable "public_dedicated_network_acl" {
  type        = bool
  default     = false
  description = "This allow you to create a single acl for all the public subnets"
}

variable "private_dedicated_network_acl" {
  type        = bool
  default     = false
  description = "This allow you to create a single acl for all the private subnets"
}

variable "public_inbound_acl_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "this allow you to write a inbound acl rule for all the public subnets"
}

variable "public_outbound_acl_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "this allow you to write a outbound acl rule for all the public subnets"
}

variable "private_inbound_acl_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "this allow you to write a inbound acl rule for all the private subnets "
}

variable "private_outbound_acl_rules" {
  type        = list(map(string))
  default     = [{}]
  description = "this allow you to write a outbound acl rule for all the private subnets"
}


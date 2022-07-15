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
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }
}

provider "aws" {
  profile="default"
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main vpc",
  }
}

resource "aws_key_pair" "public_server_key"{
  public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCo4PS0IRvvqDY9ARiPZhee6D97fOOc+hbSGctSNemhdxeDNwtPvi8nbxMvd1Gc1bfRlcNqfsDNByOnCXqNpuywyNf5rBsOUhOwldtdyKYg/OAzhBm8hHMHxjKmG1uDamOXfFEgi3Xwf/VL3q0AMAZzfoO6qxVAEOrM8J+e0KeUmbitRBCclTX6hQpXxfQCjLdJ5C2Z6XfDW6DPw8RQyC4QfZK+JFjIcVKskQ+stwHrscnRNt27NRV+2QvPvWmQQUVqwTYwTlrixvQP+R2eIoenrbl8Ms3s1vsqLLi6KoAcWpgBluLaIY/hJsfzgX6p9byybuxWark9oMfOcj9r/Q0NY93l6vmA497ST2uQlXufNkuvF4547ZlJEil3oJnpK1xhboITPZck3ie2tyrmwuABAyTBDIXfdLQj4PxytLY5gDMWiun3zMVnUHLSobnRy9MRhALhS0RiA9TezclSwmgTiEH/D+ozqF6GNizVSg2BiWhiBlSZrzk5rJEKl9B1DV0= adminuser@kali"
  key_name="for-us"
}

resource "aws_instance" "public_server" {
  ami        = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name=aws_key_pair.public_server_key.key_name
  security_groups=["${aws_security_group.allow_ssh.id}"]
}

resource "aws_subnet" "public_subnet"{
  cidr_block = "10.0.1.0/24"
  vpc_id=aws_vpc.main.id
  map_public_ip_on_launch=true
  
}

output "public_ip"{
  value=aws_instance.public_server.public_ip
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh from anywhere"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "ssh traffic from anywhere"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["157.49.173.59/32"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# route table for the subnet
resource "aws_route_table" "public_router"{
  vpc_id=aws_vpc.main.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_internet_gateway.id
  }
  tags={
    Name="public server route table"
  }
}

# new internet gateway
resource "aws_internet_gateway" "terraform_internet_gateway"{
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "isp Router"
  }
}

# for associating the route table with the subnet
resource "aws_route_table_association" "public_route_table"{
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_router.id
}
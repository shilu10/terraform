terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}


provider "aws"{
    region = "us-east-1"
    profile = "default"
}

resource "aws_instance" "new"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.private_subnet.id
    tags = {
        "Name": "private instance"
    }
}

data "aws_vpc" "default_vpc"{
    id = var.vpc_id
}

resource "aws_subnet" "private_subnet"{
    vpc_id = data.aws_vpc.default_vpc.id
    cidr_block = "172.31.100.0/24"
    tags = {
        Name = "private subnet" 
    }
}


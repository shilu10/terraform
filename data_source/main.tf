terraform{

}

provider "aws"{
    region = "us-east-1"
    profile = "default"
}

resource "aws_instance" "new"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.private_subnet.ami_id
    tags = {
        "Name": "private instance"
    }
}

data "aws_vpc" "default_vpc"{
    vpc_id = "vpc-0714ac9c0ba61390b"
}

resource "aws_subnet" "private_subnet"{
    vpc_id = default_vpc.vpc_id
    cidr_block = "172.31.1.0"
}


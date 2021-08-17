# Let's build a script to connect to aws and download/setup all dependencies required
# keyword: provider aws
provider "aws" {
  region = var.aws_region
}

# Then we will run terraform init

# Then will move on to launch aws services

# Let's launch an ex2 instance in eu-west-1 with

# Keyword called "resource" provide resource name and give name with specific details to the service
# Resource aws_ex2_instance, name it as eng89_madeline_terraform, ami, type of instance, with or without ip

resource "aws_vpc" "prod-vpc" {
  cidr_block = var.aws_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = true
  instance_tenancy = "default"

  tags = {
    "Name" = var.aws_vpc_name
  }
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = var.aws_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.aws_region

  tags = {
    "Name" = var.aws_subnet_name
  }
}

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = var.aws_igw_name
  }
}

resource "aws_route_table" "prod-public-crt" {
	vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_security_group" "prod-public-sg" {
    name = var.aws_security_group_name
    description = "Our secruity group"
    vpc_id = aws_vpc.prod-vpc.id
    # All traffic outbound
    egress { 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allowing for us to SSH in
    ingress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # Allows anyone to connect via HTTP
    ingress { 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # Allows anyone to connect to the node app
    ingress { 
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        "Name" = var.aws_security_group_name
    }
}

resource "aws_instance" "app_instance" {
  key_name = var.aws_key_name # The name of a key already uploaded to AWS
  ami = var.aws_ami_id # The ami that we want to use. I'm using the default Ubuntu 18.04 ami
  instance_type = "t2.micro" # The type of instance you want to run, `t2.micro` is on the free plan
  associate_public_ip_address = true # Set this to false if you don't want a public IP available
  tags = {
    "Name" = "eng89_madeline_terraform" # Just a name tag
  }
}

# Most commonly used commands for terraform:
# `terraform plan` checks the syntax and validates the instruction we have provided in this script

# Once we are happy and the outcome is green we could run `terraform apply`
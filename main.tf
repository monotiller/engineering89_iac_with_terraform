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
resource "aws_instance" "app_instance" {
  key_name = var.aws_key_name
  # aws_key_path = var.aws_key_path
  ami = var.aws_ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    "Name" = "eng89_madeline_terraform"
  }
}

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
  vpc_id = var.aws_vpc_name
  cidr_block = var.aws_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.aws_region

  tags = {
    "Name" = var.aws_subnet_name
  }
}

resource "aws_internet_gateway" "prod-igw" {
  
}

# Most commonly used commands for terraform:
# `terraform plan` checks the syntax and validates the instruction we have provided in this script

# Once we are happy and the outcome is green we could run `terraform apply`
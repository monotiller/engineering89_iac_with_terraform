resource "aws_vpc" "prod-vpc" {
  cidr_block = var.aws_cidr_block
  instance_tenancy = "default"  
  tags = {
    "Name" = var.aws_vpc_name
  }
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = var.aws_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.aws_subnet_region

  tags = {
    "Name" = var.aws_subnet_name
  }
}
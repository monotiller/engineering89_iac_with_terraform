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
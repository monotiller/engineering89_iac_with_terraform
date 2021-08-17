# Let's create variables for our resources in main.tf to make use of DRY

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_subnet_region" {
  default = "eu-west-1a"
}
variable "aws_key_name" {
  default = "eng89_madeline_rsa"
}

variable "aws_key_path" {
  default = "~/.ssh/eng89_madeline_rsa.pem"
}

variable "aws_ami_id" {
  default = "ami-0943382e114f188e8"
}

variable "aws_vpc_name" {
  default = "eng89_madeline_terraform_vpc"
}

variable "aws_cidr_block" {
  default = "10.252.0.0/16"
}

variable "aws_subnet_name" {
  default = "eng89_madeline_terraform_subnet"
}

variable "aws_igw_name" {
  default = "eng89_madeline_terraform_igw"
}

variable "aws_route_table_name" {
  default = "eng89_madeline_terraform_route_table"
}

variable "my_ip_address" {
  default = "0.0.0.0/0"
}

variable "aws_security_group_name" {
  default = "eng89_madeline_terraform_security_group"
}

variable "node_github_repository" {
  default = "https://github.com/monotiller/engineering89_vagrant.git"
}
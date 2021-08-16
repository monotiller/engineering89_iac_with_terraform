# Let's build a script to connect to aws and download/setup all dependencies required
# keyword: provider aws
provider "aws" {
  region = "eu-west-1"
}

# Then we will run terraform init

# Then will move on to launch aws services

# Let's launch an ex2 instance in eu-west-1 with

# Keyword called "resource" provide resource name and give name with specific details to the service
# Resource aws_ex2_instance, name it as eng89_madeline_terraform, ami, type of instance, with or without ip
resource "aws_instance" "app_instance" {
  key_name = "eng89_madeline_rsa"
  ami = "ami-0943382e114f188e8"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    "Name" = "eng89_madeline_terraform"
  }
}

# Most commonly used commands for terraform:
# `terraform plan` checks the syntax and validates the instruction we have provided in this script

# Once we are happy and the outcome is green we could run `terraform apply`
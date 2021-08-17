provider "aws" {
  region = var.aws_region
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


resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet
  map_public_ip_on_launch = false 
  availability_zone = var.private_availiability_zone
  tags = {
    Name = "${var.infra_env}-privatesubnet"
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true 
  availability_zone = var.public_availability_zone
  tags = {
    Name = "${var.infra_env}-publicsubnet"
  }
}
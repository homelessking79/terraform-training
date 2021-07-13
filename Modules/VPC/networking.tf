resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  instance_tenancy = var.tenancy

  tags = var.vpc_tags
}

resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags                    = var.subnet_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = var.ig_id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public" {

  subnet_id = var.subnet_id

  route_table_id = var.route_table_id
}



//Output
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "ig_id" {
  value = aws_internet_gateway.main.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}
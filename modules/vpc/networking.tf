resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  instance_tenancy = var.tenancy

  tags = var.vpc_tags
}

resource "aws_subnet" "main" {
  for_each = var.azs
  vpc_id                  = var.vpc_id
  cidr_block              = each.value
  availability_zone = each.key
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
  count = length(var.subnet_id)
  subnet_id = var.subnet_id[count.index]

  route_table_id = var.route_table_id

}




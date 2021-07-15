//Output
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = [for subnet in aws_subnet.main : subnet.id]
}

output "ig_id" {
  value = aws_internet_gateway.main.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}
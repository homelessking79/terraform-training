output "instance_id" {
  value = [for instance in aws_instance.main : instance.id]
}
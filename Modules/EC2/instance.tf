resource "aws_instance" "main" {
  count = var.ec2_count * length(var.subnet_id) 
  vpc_security_group_ids = var.sg_ids
  key_name               = var.key_name
  /* count                  = var.ec2_count */
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id[count.index % length(var.subnet_id)]
  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}

output "instance_id"{
     value = [for instance in aws_instance.main : instance.id]
}
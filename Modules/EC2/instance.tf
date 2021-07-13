resource "aws_instance" "main" {
  vpc_security_group_ids = var.sg_ids
  key_name               = var.key_name
  count                  = var.ec2_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  tags = {
    Name = var.instance_name
  }
}


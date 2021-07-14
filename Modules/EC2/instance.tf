resource "aws_instance" "main" {
  count                  = var.ec2_count * length(var.subnet_id)
  vpc_security_group_ids = var.sg_ids
  key_name               = var.key_name
  /* count                  = var.ec2_count */
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id[count.index % length(var.subnet_id)]
  tags = {
    Name = "${var.instance_name}-${count.index}"
  }

  provisioner "remote-exec" {

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.pvt_key)
    }

    inline = ["sudo yum search python3", 
              "sudo yum install python3 -y"]

  }

    provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${var.pvt_key}  ../ansible-playbook/nginx-setup.yml"
  }
}

  

output "instance_id" {
  value = [for instance in aws_instance.main : instance.id]
}

variable "ec2_count" {
  default = "1"
}

variable "ami_id" {}

variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {
  type = list(string)
}

variable "instance_name" {
  type = string
}

variable "ingress" {
  type    = list(number)
  default = [3000, 22]
}

variable "vpc_id" {}

variable "sg_name" {
  description = "Name of specific security group"
  type        = string
}

variable "sg_ids" {
  description = "List of security group ids"
  type        = list(any)
}

variable "key_name" {
  description = "SSH public key"
  type        = string
}

variable "pvt_key"{
  default = "../private-key-ssh/terraform-training.pem"
}
variable "target_group_name" {
  description = "Define target group's name"
  type        = string
}

variable "port" {
  default = 80
}
variable "listener_port"{
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "vpc_id" {}

variable "target_group_arn"{
    type = string
}

variable "instance_id"{
    type = list(string)
}

variable "nlb_name"{
    type = string
}

variable "subnet_id"{
    type = list(string)
}

variable "environment_name"{
    type = string
}

variable "nlb_arn"{
    type = string
}


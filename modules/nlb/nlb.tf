resource "aws_lb_target_group" "main" {
  name     = var.target_group_name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "main" {
  count = length(var.instance_id)
  target_group_arn = var.target_group_arn
  target_id        = var.instance_id[count.index]
}

resource "aws_lb" "main" {
  name               = var.nlb_name
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = var.environment_name
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = var.nlb_arn
  port              = var.listener_port
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}


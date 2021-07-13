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

  enable_deletion_protection = true

  tags = {
    Environment = var.environment_name
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = var.nlb_arn
  port              = var.port
  protocol          = "TCP"
  /* certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  alpn_policy       = "HTTP2Preferred" */

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

output "nlb_arn"{
    value = aws_lb.main.arn
}

output "target_group_arn"{
    value = aws_lb_target_group.main.arn
}
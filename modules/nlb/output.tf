output "nlb_arn"{
    value = aws_lb.main.arn
}

output "target_group_arn"{
    value = aws_lb_target_group.main.arn
}

output "nlb_dns"{
  value = aws_lb.main.dns_name
}
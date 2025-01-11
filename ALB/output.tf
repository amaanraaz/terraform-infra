output "aws_lb_tg" {
  description = "aws lb tg"
  value = aws_lb_target_group.my_target_group.arn
}
output "alb_dns_name" {
    description = "dns address"
    value = aws_lb.tf-lb.dns_name
}

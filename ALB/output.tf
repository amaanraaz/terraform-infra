output "aws_lb" {
  description = "ID of the public instance"
  value       = aws_lb.tf-lb
}

output "aws_lb_tg" {
  description = "aws lb tg"
  value = aws_lb_target_group.my_target_group.arn
}
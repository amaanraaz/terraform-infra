# aws load balancer
resource "aws_lb" "tf-lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = [var.subnets[0],var.subnets[1]]


  tags = {
    Environment = "my-tf-lb"
  }
}

# target groups
resource "aws_lb_target_group" "my_target_group" {
  name     = "tf-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# target group association
resource "aws_lb_target_group_attachment" "target-group-association1" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id = var.target_ids[0]
}

resource "aws_lb_target_group_attachment" "target-group-association2" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id = var.target_ids[1]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tf-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}
resource "aws_launch_template" "my_tf_launch_template" {
  name_prefix = "my_tf_launch_template"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  network_interfaces {
    security_groups = [var.security_group] # Reference to the existing SG
  }
}

# resource "aws_autoscaling_group" "tf_asg" {
#   availability_zones = ["us-east-1a","us-east-1b"]
#   desired_capacity   = 2
#   max_size           = 4
#   min_size           = 1
  
#   launch_template {
#     id      = aws_launch_template.my_tf_launch_template.id
#     version = "$Latest"
#   }

#   target_group_arns = [var.aws_tg_arn]
#   depends_on = [ aws_launch_template.my_tf_launch_template ]
# }


resource "aws_autoscaling_group" "app" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = [var.subnets[0], var.subnets[1]]
  target_group_arns    = [var.aws_tg_arn]
  health_check_type    = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.my_tf_launch_template.id
    version = "$Latest"
  }

  tag
    {
      key                 = "Name"
      value               = "nginx-tf"
      propagate_at_launch = true
    }
}

# Launch Template
resource "aws_launch_template" "app" {
  name_prefix   = "app-lt-"
  image_id      = data.aws_ssm_parameter.al2023_arm64_param.value
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "app" {
  name                      = "app-asg"
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 4
  vpc_zone_identifier       = [
    aws_subnet.private_ec2_1.id,
    aws_subnet.private_ec2_2.id
  ]
  health_check_type         = "EC2"
  target_group_arns         = [aws_lb_target_group.app-tg.arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "app-instance"
    propagate_at_launch = true
  }
  depends_on = [aws_subnet.public_1]
}

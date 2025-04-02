
resource "random_id" "launch_template_suffix" {
  byte_length = 4
}

resource "aws_launch_template" "app_launch_template" {
  #name          = "app-launch-template-${timestamp()}"
  name = "app-launch-template-${random_id.launch_template_suffix.hex}"
  image_id      = var.ami_id
  instance_type = var.instance_type
  #key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.app_sg.id]
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "app-autoscaling-group"
  #launch_configuration      = aws_launch_configuration.app_launch_config.name
  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"  # Usa la última versión del template
  }
  vpc_zone_identifier       = [var.subnet_id, var.subnet_b_id]
  min_size                  = 2
  max_size                  = 5
  desired_capacity          = 2

  
  tag {
    key                 = "Name"
    value               = "app-server-${var.environment}"
    propagate_at_launch = true
  }
  
}

resource "aws_security_group" "app_sg" {
  name_prefix = "app-sg-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
    #cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Security Group para el ALB
resource "aws_security_group" "alb_sg" {
  name_prefix = "alb-sg-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Application Load Balancer
resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.subnet_id, var.subnet_b_id] # Asegura redundancia en múltiples AZs

  enable_deletion_protection = false
}

# Target Group para el ALB
resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

# Listener para el ALB
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
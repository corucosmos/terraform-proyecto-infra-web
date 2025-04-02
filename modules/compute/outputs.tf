
output "autoscaling_group_name" {
  value = aws_autoscaling_group.app_asg.name
  description = "Name of the Auto Scaling Group"
}

output "launch_template_name" {
  value = aws_launch_template.app_launch_template.name
}

output "asg_name" {
  value = aws_autoscaling_group.app_asg.name
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}
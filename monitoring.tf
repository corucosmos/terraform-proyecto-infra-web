resource "aws_sns_topic" "alerts" {
  name = "alarm-topic"  # Nombre del topic para alertas
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.email #"icorujo@gmail.com"
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "alarm-ec2-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alerta cuando CPU > 80% por 2 periodos"

  dimensions = {
    AutoScalingGroupName = module.compute.asg_name  # Referencia al output del módulo
  }


  actions_enabled = true
  alarm_actions   = [aws_sns_topic.alerts.arn]
}
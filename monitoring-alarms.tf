# Topico do SNS — o "mensageiro" que distribui notificacoes.
resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-alerts"
}

# Inscreve o e-mail no topico. A AWS manda um e-mail de confirmacao
# assim que este recurso for criado — sem confirmar, nenhuma
# notificacao futura chega.
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# Alarme: observa a CPU media da api, dispara se ficar acima de 70%
# por 2 periodos consecutivos de 1 minuto (ou seja, 2 minutos seguidos).
resource "aws_cloudwatch_metric_alarm" "api_cpu_high" {
  alarm_name          = "${var.project_name}-api-cpu-high"
  alarm_description   = "CPU media da api acima de 70% por 2 minutos consecutivos"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.api.name
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]
}

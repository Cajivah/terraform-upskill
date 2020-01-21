resource "aws_lb_target_group" "lb-http-tg" {
  name     = local.name
  port     = local.http_port
  protocol = local.http_protocol
  vpc_id   = var.vpc_id

  health_check {
    protocol            = local.http_protocol
    path                = var.health_check_path
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
    matcher             = "200"
  }
}

resource "aws_lb_listener_rule" "lb-listener-https-rule" {
  listener_arn = var.https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-http-tg.arn
  }

  condition {}
}

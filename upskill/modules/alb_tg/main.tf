resource "aws_lb_target_group" "lb_http_tg" {
  name     = local.http_tg_name
  port     = local.http_port
  protocol = local.http_protocol
  vpc_id   = var.vpc_id
  tags     = var.tags
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

resource "aws_lb_listener_rule" "forward_to_tg" {
  listener_arn = var.https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_http_tg.arn
  }

  condition {
    field  = "path-pattern"
    values = [
      "/${var.app_name}*"]
  }
}

resource "aws_lb_target_group" "lb_http_tg" {
  name     = local.name
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

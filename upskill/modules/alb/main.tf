resource "aws_lb" "alb" {
  name = local.lb_name
  load_balancer_type = "application"
  subnets = var.subnet_ids
  security_groups = var.sg_ids
}

resource "aws_lb_target_group" "default-tg" {
  name      = local.default_tg_name
  port      = local.https_port
  protocol  = local.https_protocol
  vpc_id    = var.vpc_id
}

resource "aws_lb_listener" "redirect_http_to_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = local.http_port
  protocol          = local.http_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = local.https_port
      protocol    = local.https_protocol
      status_code = local.http_redirect
    }
  }
}

resource "aws_lb_listener" "lb-listener-https" {
  depends_on = [
    "aws_lb_target_group.default-tg"
  ]

  default_action {
    target_group_arn  = aws_lb_target_group.default-tg.arn
    type              = "forward"
  }

  load_balancer_arn = aws_lb.alb.arn
  port              = local.https_port
  protocol          = local.https_protocol
  certificate_arn   = var.ssl_cert_arn
  ssl_policy = local.tls_1_2
}

resource "aws_lb" "alb" {
  name = local.cluster_name
  load_balancer_type = "application"
  subnets = var.subnet_ids
  security_groups = var.sg_ids
}

resource "aws_lb_listener" "https" {
  count = length(aws_lb)
  load_balancer_arn = aws_lb.alb[count.index].arn

  port = local.https_port
  protocol = local.https_protocol

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code = 404
    }
  }
}

resource "aws_lb_listener_rule" "asg" {
  count = length(aws_lb_listener.https)
  listener_arn = aws_lb_listener.https[count.index].arn
  priority = 100

  condition {
    field = "path-pattern"
    values = [
      "*"]
  }

  action {
    type = "forward"
    target_group_arn = var.asg_target_group_ids[count.index]
  }
}

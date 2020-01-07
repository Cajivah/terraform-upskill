resource "aws_instance" "web" {
  ami = ""
  instance_type = var.instance_type
  security_groups = [
    aws_security_group.instance.id]
  user_data = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance"
}

resource "aws_security_group_rule" "allow_server_http_inbound" {
  type = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port = var.server_port
  to_port = var.server_port
  protocol = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_lb" "alb" {
  name = "${var.prefix}_asg"
  load_balancer_type = "application"
  subnets = var.subnet_id
  security_groups = [
    var.security_group_id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn

  port = local.http_port

  protocol = "HTTP"

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

resource "aws_lb_target_group" "lb_target" {
  name = "${var.prefix}_asg"
  port = var.server_port
  protocol = local.https_protocol
  vpc_id = var.vpc_id

  health_check {
    path = "/"
    protocol = local.https_protocol
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "lb_listener_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority = 100

  condition {
    field = "path-pattern"
    values = [
      "*"]
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target.arn
  }
}


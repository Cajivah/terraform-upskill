locals {
  http_port          = 80
  any_port           = 0
  any_protocol       = "-1"
  tcp_protocol       = "tcp"
  https_protocol     = "https"
  https_port         = 443
  all_ips            = [
    "0.0.0.0/0"]
  web_asg_name       = "${aws_launch_configuration.web.name}-asg"
  web_lc_name_prefix = "${var.owner}-${var.app_name}-${var.env}-instance"
}

resource "aws_launch_configuration" "web" {
  image_id = var.web_ami
  instance_type = var.instance_type
  security_groups = [
    var.security_group_id]
  user_data = data.template_file.user_data.rendered

  //  name_prefix = var.zones[count.index].zone -- commented out because there should be only one config
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web.name
  vpc_zone_identifier = [
    var.subnet_ids[count.index]]
  target_group_arns = [
    aws_lb_target_group.web_asg_tg.arn]
  health_check_type = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key = "Name"
    value = local.cluster_name
    propagate_at_launch = true
  }
}

resource "aws_lb_target_group" "web_asg_tg" {
  name = local.cluster_name
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

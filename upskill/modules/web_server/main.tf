resource "aws_launch_configuration" "web" {
  image_id        = var.web_ami
  instance_type   = var.instance_type
  security_groups = [
    var.security_group_id]
  user_data       = data.template_file.user_data.rendered
  name_prefix     = local.web_lc_name_prefix

  iam_instance_profile = var.instance_profile_name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web.name
  vpc_zone_identifier  = var.subnet_ids
  target_group_arns    = [
    module.alb-tg.alb-tg-arn]
  health_check_type    = "ELB"
  name                 = local.web_asg_name
  min_size             = var.min_size
  max_size             = var.max_size

  tag {
    key                 = "Name"
    value               = local.cluster_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }

  tag {
    key                 = "Autoscaling"
    value               = true
    propagate_at_launch = true
  }
}

module "alb-tg" {
  source             = "../alb_tg"
  env                = var.env
  health_check_path  = "/"
  https_listener_arn = var.https_listener_arn
  name               = local.cluster_name
  vpc_id             = var.vpc_id
  tags               = var.tags
}

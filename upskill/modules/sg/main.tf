resource "aws_security_group" "alb_sg" {
  count  = length(var.zones)
  name   = "${local.domain_prefix}_${var.zones[count.index].zone}_alb_sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "web_sg" {
  name   = "${local.domain_prefix}_web_sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "db_sg" {
  count  = length(var.zones)
  name   = "${local.domain_prefix}_${var.owner}_${var.zones[count.index].zone}_db_sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allow_http_inbound" {
  count             = length(aws_security_group.alb_sg)
  type              = "ingress"
  security_group_id = aws_security_group.alb_sg[count.index].id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = var.allowed_external_ips
}

resource "aws_security_group_rule" "allow_https_inbound" {
  count             = length(aws_security_group.alb_sg)
  type              = "ingress"
  security_group_id = aws_security_group.alb_sg[count.index].id

  from_port   = local.https_port
  to_port     = local.https_port
  protocol    = local.tcp_protocol
  cidr_blocks = var.allowed_external_ips
}

resource "aws_security_group_rule" "allow_all_outbound" {
  count             = length(aws_security_group.alb_sg)
  type              = "egress"
  security_group_id = aws_security_group.alb_sg[count.index].id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow-alb-http-inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.web_sg.id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.alb_subnet_cidrs
}

resource "aws_security_group_rule" "allow-any-outbound-to-alb" {
  type              = "egress"
  security_group_id = aws_security_group.web_sg.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow-web-inbound" {
  count             = length(aws_security_group.db_sg)
  type              = "ingress"
  security_group_id = aws_security_group.db_sg[count.index].id

  from_port   = local.db_port
  to_port     = local.db_port
  protocol    = local.any_protocol
  cidr_blocks = [
    var.zones[count.index].web_subnet_cidr]
}

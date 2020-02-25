resource "aws_security_group" "jmalyjasiak-alb_sg" {
  count  = length(var.zones)
  name   = "${local.domain_prefix}-${var.zones[count.index].zone}-alb-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "jmalyjasiak-web_sg" {
  name   = "${local.domain_prefix}-web-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "jmalyjasiak-db_sg" {
  count  = length(var.zones)
  name   = "${local.domain_prefix}-${var.owner}-${var.zones[count.index].zone}-db-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "jmalyjasiak-alb_all_http_inbound" {
  count             = length(aws_security_group.jmalyjasiak-alb_sg)
  type              = "ingress"
  security_group_id = aws_security_group.jmalyjasiak-alb_sg[count.index].id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = var.allowed_external_ips
}

resource "aws_security_group_rule" "jmalyjasiak-alb_all_https_inbound" {
  count             = length(aws_security_group.jmalyjasiak-alb_sg)
  type              = "ingress"
  security_group_id = aws_security_group.jmalyjasiak-alb_sg[count.index].id

  from_port   = local.https_port
  to_port     = local.https_port
  protocol    = local.tcp_protocol
  cidr_blocks = var.allowed_external_ips
}

resource "aws_security_group_rule" "jmalyjasiak-alb_allow_outbound_to_web" {
  count             = length(aws_security_group.jmalyjasiak-alb_sg)
  type              = "egress"
  security_group_id = aws_security_group.jmalyjasiak-alb_sg[count.index].id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.web_subnet_cidrs
}

resource "aws_security_group_rule" "jmalyjasiak-web_allow_inbound_from_alb" {
  type              = "ingress"
  security_group_id = aws_security_group.jmalyjasiak-web_sg.id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.alb_subnet_cidrs
}

resource "aws_security_group_rule" "jmalyjasiak-web_allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.jmalyjasiak-web_sg.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "jmalyjasiak-db_allow_web_inbound" {
  count             = length(aws_security_group.jmalyjasiak-db_sg)
  type              = "ingress"
  security_group_id = aws_security_group.jmalyjasiak-db_sg[count.index].id

  from_port   = local.db_port
  to_port     = local.db_port
  protocol    = local.any_protocol
  cidr_blocks = [
    var.zones[count.index].web_subnet_cidr]
}

locals {
  domain_prefix = "${var.owner}-${var.identifier}-${var.env}"

  db_username = data.aws_ssm_parameter.db_username.value
  db_password = data.aws_ssm_parameter.db_password.value
}

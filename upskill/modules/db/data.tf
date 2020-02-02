data "aws_ssm_parameter" "db_username" {
  name = var.db_username_key
}

data "aws_ssm_parameter" "db_password" {
  name = var.db_password_key
}

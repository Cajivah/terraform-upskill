data "aws_ssm_parameter" "db_username" {
  name = "${var.env}_${var.db_name}_username"
}

data "aws_ssm_parameter" "db_password" {
  name = "${var.env}_${var.db_name}_password"
}

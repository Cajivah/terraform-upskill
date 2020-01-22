locals {
  role_name                  = "${var.name}_${var.env}_role"
  role_policy_name           = "${var.name}_${var.env}_instance_role_policy"
  role_instance_profile_name = "${var.name}_${var.env}_instance_profile"
  instance-role              = file("${path.module}/policies/instance-role.json")
}

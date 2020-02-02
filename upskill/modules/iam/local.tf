locals {
  domain_prefix              = "${var.owner}_${var.name}_${var.env}"
  role_name                  = "${local.domain_prefix}_role"
  role_policy_name           = "${local.domain_prefix}_instance_role_policy"
  role_instance_profile_name = "${local.domain_prefix}_instance_profile"
  instance-role              = file("${path.module}/policies/instance-role.json")
}

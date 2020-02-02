locals {
  domain_prefix              = "${var.owner}-${var.name}-${var.env}"
  role_name                  = "${local.domain_prefix}-role"
  role_policy_name           = "${local.domain_prefix}-instance-role-policy"
  role_instance_profile_name = "${local.domain_prefix}-instance-profile"
  instance-role              = file("${path.module}/policies/instance-role.json")
}

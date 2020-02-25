resource "aws_iam_role" "jmalyjasiak-instance_role" {
  name               = local.role_name
  assume_role_policy = local.instance-role
}

resource "aws_iam_role_policy" "jmalyjasiak-instance_role_policy" {
  name   = local.role_policy_name
  policy = data.template_file.instance-role-policy.rendered
  role   = aws_iam_role.jmalyjasiak-instance_role.id
}

resource "aws_iam_instance_profile" "jmalyjasiak-instance_profile" {
  name = local.role_instance_profile_name
  path = "/"
  role = aws_iam_role.jmalyjasiak-instance_role.name
}

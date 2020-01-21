resource "aws_iam_role" "instance_role" {
  name = local.role_name
  assume_role_policy = data.template_file.instance-role
}

resource "aws_iam_role_policy" "instance_role_policy" {
  name = local.role_policy_name
  policy = data.template_file.instance-role-policy.rendered
  role = aws_iam_role.instance_role.id
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = local.role_instance_profile_name
  path = "/"
  role = aws_iam_role.instance_role.name
}

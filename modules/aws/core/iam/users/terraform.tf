resource "aws_iam_user" "main" {
  name                      = "${var.username}"
  force_destroy             = "true"
}

resource "aws_iam_user_group_membership" "main" {
  count                     = "${var.group_membership != "" ? 1 : 0}"
  user                      = "${aws_iam_user.main.name}"
  groups                    = [
    "${var.group_membership}"
  ]
}

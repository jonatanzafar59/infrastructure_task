resource "aws_iam_group" "main" {
  name    = "${var.name}"
}

resource "aws_iam_group_policy" "main" {
  name    = "${var.name}-policy"
  group   = "${aws_iam_group.main.id}"
  policy  = "${var.aws_iam_group_policy}"
}

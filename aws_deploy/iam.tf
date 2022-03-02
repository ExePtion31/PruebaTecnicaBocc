resource "aws_iam_role" "lambda_group_role" {
  name               = "${var.stack_id}-group-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_group_assume_role_policy_document.json
}

# Lambda Trigger Cloudwatch policy
resource "aws_iam_policy" "lambda_group_logs_policy" {
  name = "${var.stack_id}-lambda-group-logs"
  policy = data.aws_iam_policy_document.lambda_group_assume_logs_policy_document.json
}

resource "aws_iam_role_policy_attachment" "lambda_trigger_logs_policy_attachment" {
  role       = aws_iam_role.lambda_group_role.name
  policy_arn = aws_iam_policy.lambda_group_logs_policy.arn
}

#Role for STS
resource "aws_iam_role" "lambda_group_sts_role" {
  name = "${var.stack_id}-lambda-group-sts-role"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_group_assume_sts_policy_document.json}"
}
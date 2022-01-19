# Create logs group
resource "aws_cloudwatch_log_group" "lambda_group_log_group" {
  name              = "/aws/lambda/${var.stack_id}-group"
  retention_in_days = 30
}
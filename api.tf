resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "${var.stack_id}-api"
  description = "API Gateway for ${var.stack_id}"
  tags = local.common_tags
}

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "${var.stack_id}-api"
  description = "API Gateway for ${var.stack_id}"
  tags = local.common_tags
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "groups"
}

resource "aws_api_gateway_method" "api_gateway_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.api_gateway_resource.id
  http_method   = "GET"
  authorization = "NONE"
}
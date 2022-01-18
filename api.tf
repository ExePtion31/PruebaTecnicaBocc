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
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api_gateway.id
  resource_id             = aws_api_gateway_resource.api_gateway_resource.id
  http_method             = aws_api_gateway_method.api_gateway_get_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_groups.invoke_arn
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.api_gateway_resource.id
  http_method = aws_api_gateway_method.api_gateway_get_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "api_gateway_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.api_gateway_resource.id
  http_method = aws_api_gateway_method.api_gateway_get_method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code
  response_templates = {
        "application/json" = <<EOF
    #set($inputRoot = $input.path('$'))
    <?xml version="1.0" encoding="UTF-8"?>
    <message>
        $inputRoot.body
    </message>
    EOF
  }
}
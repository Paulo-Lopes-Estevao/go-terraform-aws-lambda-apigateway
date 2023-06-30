resource "aws_apigatewayv2_api" "lambda_api_gateway" {
  name          = var.apigatewayv2_api_main.name
  protocol_type = var.apigatewayv2_api_main.protocol_type
}

resource "aws_apigatewayv2_stage" "lambda_api_gateway_stage" {
  api_id      = aws_apigatewayv2_api.lambda_api_gateway.id
  name        = "dev"
  auto_deploy = true

   access_log_settings {
      destination_arn = aws_cloudwatch_log_group.api_gw.arn

      format = jsonencode({
        requestId               = "$context.requestId"
        sourceIp                = "$context.identity.sourceIp"
        requestTime             = "$context.requestTime"
        protocol                = "$context.protocol"
        httpMethod              = "$context.httpMethod"
        resourcePath            = "$context.resourcePath"
        routeKey                = "$context.routeKey"
        status                  = "$context.status"
        responseLength          = "$context.responseLength"
        integrationErrorMessage = "$context.integrationErrorMessage"
        }
      )
    }
}

resource "aws_apigatewayv2_integration" "lambda_api_gateway_integration" {
  api_id             = aws_apigatewayv2_api.lambda_api_gateway.id
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.lambda_handler.invoke_arn
}

resource "aws_apigatewayv2_route" "get_lambda_api_gateway_route" {
  api_id    = aws_apigatewayv2_api.lambda_api_gateway.id

  route_key = "GET /hello"
  target = "integrations/${aws_apigatewayv2_integration.lambda_api_gateway_integration.id}"
}

resource "aws_cloudwatch_log_group" "api_gw" {
  name              = "/aws/apigateway/${aws_apigatewayv2_api.lambda_api_gateway.name}"
  retention_in_days = 7
}

resource "aws_lambda_permission" "lambda_api_gateway_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_handler.function_name
  principal     = "apigateway.amazonaws.com"
  
  source_arn    = "${aws_apigatewayv2_api.lambda_api_gateway.execution_arn}/*/*"
}
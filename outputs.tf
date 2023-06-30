output "lambda_role" {
  description = "IAM role for the lambda function."
  value = aws_iam_role.lambda_role
}

output "lambda_bucket_object" {
  description = "S3 bucket object for the lambda handler."
  value = aws_s3_object.lambda_handler_bucket_object
}

output "function_name" {
  description = "Name of the lambda function."
  value = aws_lambda_function.lambda_handler.function_name
}


output "base_url" {
  description = "Base URL for the API Gateway v2 API."
  value = aws_apigatewayv2_api.lambda_api_gateway.api_endpoint
}

output "get_base_url" {
  value = aws_apigatewayv2_stage.lambda_api_gateway_stage.invoke_url
}

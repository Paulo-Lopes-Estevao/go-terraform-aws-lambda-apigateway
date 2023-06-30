variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}


variable "iam_role_policy_arn" {
  description = "ARN of the IAM role policy to attach to the lambda role."
  
  type = string
  default = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

variable "apigatewayv2_api_main" {
  description = "API Gateway v2 API for the main API."
  
  type = object({
    name          = string
    protocol_type = string
  })
  default = {
    name          = "main"
    protocol_type = "HTTP"
  }
}
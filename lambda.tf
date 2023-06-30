resource "aws_lambda_function" "lambda_handler" {
  function_name    = "LambdaHandler"
  role             = aws_iam_role.lambda_role.arn
  handler          = "app"
  source_code_hash = data.archive_file.lambda_handler_archive_file.output_base64sha256 // or filebase64sha256(handler.zip)
  runtime          = "go1.x"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_handler_bucket_object.key

  depends_on = [
    aws_s3_object.lambda_handler_bucket_object,
  ]
}

resource "aws_cloudwatch_log_group" "lambda_cloudwatch_log" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_handler.function_name}"
  retention_in_days = 14
}
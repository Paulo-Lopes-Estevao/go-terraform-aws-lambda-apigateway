provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      tag_name = "lambda-api-gateway"
    }
  }

}

data "archive_file" "lambda_handler_archive_file" {
  type        = "zip"
  source_dir  = "${path.module}/handler"
  output_path = "${path.module}/handler.zip"
}
  
resource "random_pet" "lambda_bucket_name" {
  prefix = "lambda-bucket"
  length = 4
}

resource "aws_iam_role" "lambda_role" {
  name = "handler-lambda-role"
    
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.iam_role_policy_arn
}
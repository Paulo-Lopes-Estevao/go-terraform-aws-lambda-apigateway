# Terraform - Lambda function, API Gateway and S3

### SERVERLESS - with AWS Lambda API Gateway and S3 using Terraform.

AWS Lambda functions and API gateway are often used to create serverless applications.\
Function code is written in Go and deployed using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.4.3)
- [Go](https://golang.org/doc/install) (>= 1.19.2)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) (>= 2.12.6)
- [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html)
- [AWS Credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
- [AWS s3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)

## Getting Started

### AWS Credentials

To use Terraform with AWS, you will need to create a user with the appropriate permissions.\
The user will need to have the following permissions:

- AWSLambdaFullAccess
- IAMFullAccess
- AmazonAPIGatewayAdministrator
- AmazonS3FullAccess
- CloudWatchLogsFullAccess

### AWS CLI

Configure the AWS CLI with the credentials of the user you created above.

```bash
aws configure
```

or

```bash
export AWS_ACCESS_KEY_ID="anaccesskey"

export AWS_SECRET_ACCESS_KEY="asecretkey"

export AWS_DEFAULT_REGION="us-east-1"
```

### Terraform

Terraform is an open-source infrastructure as code software tool created by HashiCorp.
It enables users to define and provision a datacenter infrastructure using a high-level configuration language known as Hashicorp Configuration Language (HCL), or optionally JSON.

### AWS Lambda

AWS Lambda is a serverless compute service that lets you run code without provisioning or managing servers, creating workload-aware cluster scaling logic, maintaining event integrations, or managing runtimes.
With Lambda, you can run code for virtually any type of application or backend service - all with zero administration.

### API Gateway

Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.
API Gateway handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, CORS support, authorization and access control, throttling, monitoring, and API version management.

## Usage

build the function binary Go file
```bash
make build
```

`terraform init` to initialize a working directory containing Terraform configuration files
```bash
terraform init
```

`terraform validate` to validate the configuration files in a directory
```bash
terraform validate
```

`terraform plan` to create an execution plan for the changes to be applied
```bash
terraform plan
```

`terraform apply` to apply the changes required to reach the desired state of the configuration
```bash
terraform apply
```

After applying the changes, you will see the API Gateway endpoint in the output.\
You can use the endpoint to test the API.

`terraform output` to inspect the current state
```bash
terraform output base_url
```

Enter the endpoint in your browser or use curl to test the API
```bash
curl https://<API_GATEWAY_ENDPOINT>/dev/hello
```

`terraform destroy` to destroy the Terraform-managed infrastructure
```bash
terraform destroy
```

## License
[MIT](LICENSE)

## Contributing

Before opening an issue or pull request, please check the project's contribution documents.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details about our code of conduct, and the process for submitting pull requests.
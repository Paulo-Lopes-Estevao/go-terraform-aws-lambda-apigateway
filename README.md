# Terraform - Lambda function and API Gateway

### SERVERLESS - with AWS Lambda and API Gateway using Terraform.

AWS Lambda functions and API gateway are often used to create serverless applications.\
Function code is written in Go and deployed using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.4.3)
- [Go](https://golang.org/doc/install) (>= 1.19.2)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) (>= 2.12.6)
- [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)

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

`terraform destroy` to destroy the Terraform-managed infrastructure
```bash
terraform destroy
```

## License
[MIT](LICENSE)

## Contributing

Before opening an issue or pull request, please check the project's contribution documents.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details about our code of conduct, and the process for submitting pull requests.
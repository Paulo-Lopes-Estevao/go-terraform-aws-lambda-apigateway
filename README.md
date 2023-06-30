# Terraform - Lambda function and API Gateway

### SERVERLESS - with AWS Lambda and API Gateway using Terraform.

AWS Lambda functions and API gateway are often used to create serverless applications.\
Function code is written in Go and deployed using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.4.3)
- [Go](https://golang.org/doc/install) (>= 1.19.2)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) (>= 2.12.6)
- [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)

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

Terraform uses a plugin-based architecture to support the numerous infrastructure and service providers available.\
The plugins are distributed separately from the core binary.\
Terraform will automatically install any plugin it requires when you run `terraform init`.

### AWS Lambda

AWS Lambda is a serverless compute service that lets you run code without provisioning or managing servers, creating workload-aware cluster scaling logic, maintaining event integrations, or managing runtimes.\
With Lambda, you can run code for virtually any type of application or backend service - all with zero administration.\
Just upload your code as a ZIP file or container image, and Lambda automatically and precisely allocates compute execution power and runs your code based on the incoming request or event, for any scale of traffic.\
You can set up your code to automatically trigger from 140 AWS services or call it directly from any web or mobile app.\
You can write Lambda functions in your favorite language (Node.js, Python, Go, Java, and more) and use both serverless and container tools, such as AWS SAM or Docker CLI, to build, test, and deploy your functions.

### API Gateway

Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.\
API Gateway handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, CORS support, authorization and access control, throttling, monitoring, and API version management.\
API Gateway has no minimum fees or startup costs. You pay for the API calls you receive and the amount of data transferred out and, with the API Gateway tiered pricing model, you can reduce your cost as your API usage scales.

### Terraform

Terraform is an open-source infrastructure as code software tool created by HashiCorp.\
It enables users to define and provision a datacenter infrastructure using a high-level configuration language known as Hashicorp Configuration Language (HCL), or optionally JSON.\
It also supports industry-standard provisioning workflows, including third-party tools such as Chef, Puppet, Ansible, and SaltStack.\
HashiCorp Terraform provides a common workflow to provision hybrid cloud infrastructure, which means you can use the same tool to manage multiple providers, including AWS, Azure, Google Cloud Platform, vSphere, OpenStack, and more.\
HashiCorp Terraform codifies cloud APIs into declarative configuration files.\
HashiCorp Terraform is distributed as a single binary. Install Terraform by unzipping it and moving it to a directory included in your system's PATH.


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
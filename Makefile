build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -v -ldflags='-d -s -w' -a -tags netgo -installsuffix netgo -o handler/app handler/main.go && \
    chmod +x handler/app

init:
	terraform init

validate:
	terraform validate

plan:
	terraform plan

apply:
	terraform apply --auto-approve

destroy:
	terraform destroy --auto-approve

.PHONY: build init validate plan apply

LAMBDA_NAME=LambdaHandler
invoke-lambda:
	aws lambda invoke --region=us-east-1 --function-name $(LAMBDA_NAME) response.json
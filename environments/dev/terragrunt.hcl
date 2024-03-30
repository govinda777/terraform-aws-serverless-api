remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-aws-serverless-api__dev"
    key            = "terraform-aws-serverless-api__dev.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-aws-serverless-api-lock-table__dev"
  }
}

inputs = {
  environment = "dev"
}
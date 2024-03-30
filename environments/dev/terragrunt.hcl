remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-aws-serverless-api__dev"
    key            = "state/${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-aws-serverless-api-lock-table__dev"
  }
}

inputs = {
  environment = "dev"
}

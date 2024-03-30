remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-aws-serverless-api--dev"
    key            = "state/${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-aws-serverless-api-lock-table--dev"
  }
}

inputs = {
  environment = "dev"
}

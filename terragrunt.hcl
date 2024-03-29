remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-aws-serverless-api"
    key            = "terraform-aws-serverless-api.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-aws-serverless-api-lock-table"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-west-2"
}
EOF
}

inputs = {
  region = "us-west-2"
}

include {
  path = find_in_parent_folders()
}




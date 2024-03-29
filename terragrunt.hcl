remote_state {
  backend = "s3"
  config = {
    bucket         = "<BUCKET_NAME>"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "<REGION>"
    encrypt        = true
    dynamodb_table = "<DYNAMODB_TABLE_FOR_LOCK>"
  }
}
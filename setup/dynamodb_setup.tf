resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-aws-serverless-api-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-serverless-api"
  acl    = "private"

  versioning {
    enabled = true
  }
}
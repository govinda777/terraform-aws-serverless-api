resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-serverless-api"
  force_destroy = true
}


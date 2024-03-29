resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-serverless-api"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

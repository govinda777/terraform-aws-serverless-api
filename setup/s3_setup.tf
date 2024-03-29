resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-serverless-api"
  acl    = "private"
}

resource "aws_s3_bucket_object" "delete_all_objects" {
  bucket = aws_s3_bucket.terraform_state.bucket

  for_each = toset(data.aws_s3_bucket_objects.terraform_state.keys)

  key = each.key

  depends_on = [aws_s3_bucket.terraform_state]
}

data "aws_s3_bucket_objects" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket
}

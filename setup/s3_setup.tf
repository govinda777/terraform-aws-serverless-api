resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-aws-serverless-api"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "purge_old_versions"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

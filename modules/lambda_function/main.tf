terraform {
  backend "s3" {}
}

resource "aws_lambda_function" "hello_world" {
  function_name = "helloWorld"
  handler       = "hello_world.handler"
  runtime       = "python3.8"

  role          = aws_iam_role.lambda_exec.arn

  source_code_hash = filebase64sha256("hello_world.zip")
  filename         = "hello_world.zip"
}

# Role do IAM para execução da Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
      },
    ]
  })
}

output "hello_world_lambda_arn" {
  value = aws_lambda_function.hello_world.arn
}
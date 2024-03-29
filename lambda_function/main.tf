resource "aws_lambda_function" "hello_world" {
  function_name = "helloWorldFunction"
  runtime       = "python3.8"
  handler       = "hello_world.handler"

  # O código fonte deve ser zipado
  source_code_hash = filebase64sha256("hello_world.zip")
  filename         = "${path.module}/hello_world.zip"

  role = aws_iam_role.lambda_exec.arn
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

resource "aws_lambda_function" "hello_world" {
  function_name = "helloWorld"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  role          = aws_iam_role.iam_for_lambda.arn

  source_code_hash = filebase64sha256("lambda_function/hello_world.zip")
  filename         = "lambda_function/hello_world.zip"
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

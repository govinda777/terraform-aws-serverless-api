resource "aws_lambda_function" "lambda" {
    function_name = "MinhaFuncaoLambda"
    handler      = "lambda_function.lambda_handler"
    runtime      = "python3.8"
    filename     = "lambda_function.zip"
    role         = aws_iam_role.lambda_exec.arn
    timeout      = 10
    memory_size  = 128
}
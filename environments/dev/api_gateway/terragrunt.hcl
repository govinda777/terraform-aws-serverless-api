dependency "lambda_function" {
  config_path = "../lambda_function"
}

inputs = {
  lambda_function_arn = dependency.lambda_function.outputs.hello_world_lambda_arn
}
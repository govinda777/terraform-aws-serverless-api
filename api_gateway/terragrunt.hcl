include {
  path = find_in_parent_folders()
}

dependency "lambda_function" {
  config_path = "../lambda_function"
}

inputs = {
  hello_world_lambda_arn = dependency.lambda_function.outputs.hello_world_lambda_arn
}


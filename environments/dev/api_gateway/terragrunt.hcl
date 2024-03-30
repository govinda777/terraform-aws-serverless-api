include {
  path = find_in_parent_folders()
}

dependency "lambda_function" {
  config_path = "../../../lambda_function"
}

terraform {
  source = "../../../modules/api_gateway"
}

inputs = {
  lambda_function_arn = dependency.lambda_function.outputs.hello_world_lambda_arn
}
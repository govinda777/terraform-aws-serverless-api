# variable "cognito_user_pool_arn" {
#   description = "ARN do User Pool do Cognito"
# }

variable "hello_world_lambda_arn" {
  description = "ARN for the hello_world Lambda function"
}

variable "region" {
  description = "The AWS region where the API gateway will be deployed"
  type        = string
}

variable "hello_world_lambda_arn" {
  description = "ARN of the hello_world Lambda function"
  type        = string
}
variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "value"
}

variable "api_gateway_description" {
  description = "The description of the API Gateway"
  type        = string
  default     = "value"
}

variable "api_gateway_stage_name" {
  description = "The stage name for the API Gateway deployment"
  type        = string
  default     = "value"
}

variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function"
  type        = string
}

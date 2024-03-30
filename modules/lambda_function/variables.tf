variable "function_name" {
  description = "Nome da função Lambda"
  type        = string
  default     = "helloWorld"
}

variable "handler" {
  description = "Handler da função Lambda"
  type        = string
  default     = "hello_world.handler"
}

variable "runtime" {
  description = "Runtime da função Lambda"
  type        = string
  default     = "python3.8"
}

variable "filename" {
  description = "Nome do arquivo da função Lambda"
  type        = string
  default     = "hello_world.zip"
}

variable "iam_role_name" {
  description = "Nome da IAM Role para a função Lambda"
  type        = string
  default     = "lambda_exec_role"
}

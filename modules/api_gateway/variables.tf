variable "api_name" {
  description = "O nome da API Gateway"
  type        = string
  default     = "MyDemoAPI"
}

variable "api_description" {
  description = "Descrição da API Gateway"
  type        = string
  default     = "Exemplo de API Gateway para a função Lambda"
}

variable "region" {
  description = "The AWS region where the API Gateway will be deployed"
  type        = string
}

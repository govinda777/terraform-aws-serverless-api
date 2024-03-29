provider "aws" {
  region = "sua-regiao-aws"
}

resource "aws_api_gateway_rest_api" "api_de_campanha" {
  name        = "API-de-Campanha"
  description = "API para gerenciamento de campanhas e usuários"
}

# Recursos e Métodos para /users
resource "aws_api_gateway_resource" "users" {
  rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
  parent_id   = aws_api_gateway_rest_api.api_de_campanha.root_resource_id
  path_part   = "users"
}

resource "aws_api_gateway_method" "users_get" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.users.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "users_post" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.users.id
  http_method   = "POST"
  authorization = "NONE"
}

# Recursos e Métodos para /users/{userId}
resource "aws_api_gateway_resource" "users_userId" {
  rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
  parent_id   = aws_api_gateway_resource.users.id
  path_part   = "{userId}"
}

resource "aws_api_gateway_method" "users_userId_get" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.users_userId.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "users_userId_put" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.users_userId.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "users_userId_delete" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.users_userId.id
  http_method   = "DELETE"
  authorization = "NONE"
}

# Recursos e Métodos para /campaigns
resource "aws_api_gateway_resource" "campaigns" {
  rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
  parent_id   = aws_api_gateway_rest_api.api_de_campanha.root_resource_id
  path_part   = "campaigns"
}

resource "aws_api_gateway_method" "campaigns_get" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.campaigns.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "campaigns_post" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.campaigns.id
  http_method   = "POST"
  authorization = "NONE"
}

# Recursos e Métodos para /campaigns/{campaignId}
resource "aws_api_gateway_resource" "campaigns_campaignId" {
  rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
  parent_id   = aws_api_gateway_resource.campaigns.id
  path_part   = "{campaignId}"
}

resource "aws_api_gateway_method" "campaigns_campaignId_get" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "campaigns_campaignId_put" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "campaigns_campaignId_delete" {
  rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
  resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
  http_method   = "DELETE"
  authorization = "NONE"
}

# Deployment da API
resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [
    aws_api_gateway_method.users_get,
    aws_api_gateway_method.users_post,
    aws_api_gateway_method.users_userId_get,
    aws_api_gateway_method.users_userId_put,
    aws_api_gateway_method.users_userId_delete,
    aws_api_gateway_method.campaigns_get,
    aws_api_gateway_method.campaigns_post,
    aws_api_gateway_method.campaigns_campaignId_get,
    aws_api_gateway_method.campaigns_campaignId_put,
    aws_api_gateway_method.campaigns_campaignId_delete,
  ]

  rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
  stage_name  = "prod"
}

output "url_da_api" {
  value = "${aws_api_gateway_rest_api.api_de_campanha.execution_arn}/prod"
}

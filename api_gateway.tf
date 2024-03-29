terraform {
  backend "s3" {}
}

resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "Exemplo de API Gateway para a função Lambda"
}

resource "aws_api_gateway_resource" "hello" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  parent_id   = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
  path_part   = "hello"
}

resource "aws_api_gateway_method" "hello_get" {
  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id   = aws_api_gateway_resource.hello.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id             = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id             = aws_api_gateway_resource.hello.id
  http_method             = aws_api_gateway_method.hello_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.hello_world_lambda_arn}/invocations"
}

resource "aws_api_gateway_deployment" "example" {
  depends_on = [
    aws_api_gateway_integration.lambda,
  ]

  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  stage_name  = "test"
}

output "api_gateway_invoke_url" {
  value = "${aws_api_gateway_deployment.example.invoke_url}/${aws_api_gateway_deployment.example.stage_name}"
}


# provider "aws" {
#   region = "sua-regiao-aws"
# }

# resource "aws_api_gateway_authorizer" "cognito_authorizer" {
#   name                   = "cognito-authorizer"
#   rest_api_id            = aws_api_gateway_rest_api.api_de_campanha.id
#   type                   = "COGNITO_USER_POOLS"
#   identity_source        = "method.request.header.Authorization"
#   provider_arns          = [var.cognito_user_pool_arn]
# }

# resource "aws_api_gateway_rest_api" "api_de_campanha" {
#   name        = "API-de-Campanha"
#   description = "API para gerenciamento de campanhas e usuários"
# }

# # Recursos e Métodos para /users
# resource "aws_api_gateway_resource" "users" {
#   rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
#   parent_id   = aws_api_gateway_rest_api.api_de_campanha.root_resource_id
#   path_part   = "users"
# }

# resource "aws_api_gateway_method" "users_get" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.users.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "users_post" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.users.id
#   http_method   = "POST"
#   authorization = "NONE"
# }

# # Recursos e Métodos para /users/{userId}
# resource "aws_api_gateway_resource" "users_userId" {
#   rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
#   parent_id   = aws_api_gateway_resource.users.id
#   path_part   = "{userId}"
# }

# resource "aws_api_gateway_method" "users_userId_get" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.users_userId.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "users_userId_put" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.users_userId.id
#   http_method   = "PUT"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "users_userId_delete" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.users_userId.id
#   http_method   = "DELETE"
#   authorization = "NONE"
# }

# # Recursos e Métodos para /campaigns
# resource "aws_api_gateway_resource" "campaigns" {
#   rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
#   parent_id   = aws_api_gateway_rest_api.api_de_campanha.root_resource_id
#   path_part   = "campaigns"
# }

# resource "aws_api_gateway_method" "campaigns_get" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.campaigns.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "campaigns_post" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.campaigns.id
#   http_method   = "POST"
#   authorization = "NONE"
# }

# # Recursos e Métodos para /campaigns/{campaignId}
# resource "aws_api_gateway_resource" "campaigns_campaignId" {
#   rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
#   parent_id   = aws_api_gateway_resource.campaigns.id
#   path_part   = "{campaignId}"
# }

# resource "aws_api_gateway_method" "campaigns_campaignId_get" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "campaigns_campaignId_put" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
#   http_method   = "PUT"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method" "campaigns_campaignId_delete" {
#   rest_api_id   = aws_api_gateway_rest_api.api_de_campanha.id
#   resource_id   = aws_api_gateway_resource.campaigns_campaignId.id
#   http_method   = "DELETE"
#   authorization = "NONE"
# }

# # Deployment da API
# resource "aws_api_gateway_deployment" "api_deployment" {
#   depends_on = [
#     aws_api_gateway_method.users_get,
#     aws_api_gateway_method.users_post,
#     aws_api_gateway_method.users_userId_get,
#     aws_api_gateway_method.users_userId_put,
#     aws_api_gateway_method.users_userId_delete,
#     aws_api_gateway_method.campaigns_get,
#     aws_api_gateway_method.campaigns_post,
#     aws_api_gateway_method.campaigns_campaignId_get,
#     aws_api_gateway_method.campaigns_campaignId_put,
#     aws_api_gateway_method.campaigns_campaignId_delete,
#   ]

#   rest_api_id = aws_api_gateway_rest_api.api_de_campanha.id
#   stage_name  = "prod"
# }

# output "url_da_api" {
#   value = "${aws_api_gateway_rest_api.api_de_campanha.execution_arn}/prod"
# }

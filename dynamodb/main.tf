resource "aws_dynamodb_table" "meu_dynamodb_table" {
  name           = "MinhaTabelaDynamoDB"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  # Adicione quaisquer atributos adicionais e configurações de acordo com suas necessidades
}

# Política de acesso para Lambda
resource "aws_iam_policy" "lambda_dynamodb_access" {
  name        = "LambdaDynamoDBAccessPolicy"
  description = "Política de acesso do IAM para permitir que a Lambda acesse o DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ],
        Resource = aws_dynamodb_table.meu_dynamodb_table.arn,
        Effect   = "Allow"
      }
    ]
  })
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.meu_dynamodb_table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.meu_dynamodb_table.arn
}

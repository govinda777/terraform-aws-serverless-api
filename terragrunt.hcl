remote_state {
  backend = "s3"
  # Configurações do backend remoto, como bucket, chave, região, etc.
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "sua-regiao-aws"
  # Qualquer outra configuração necessária para o provider
}
EOF
}

output "api_gateway_invoke_url" {
  description = "URL de invocação da API Gateway"
  value       = "${aws_api_gateway_deployment.example.invoke_url}/${aws_api_gateway_deployment.example.stage_name}"
}

output "api_gateway_id" {
  description = "ID da API Gateway"
  value       = aws_api_gateway_rest_api.MyDemoAPI.id
}

output "api_gateway_root_resource_id" {
  description = "ID do recurso raiz da API Gateway"
  value       = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
}

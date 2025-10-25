output "api_id" {
  description = "ID of the API Gateway"
  value       = aws_apigatewayv2_api.visitor_api.id
}

output "api_endpoint" {
  description = "Endpoint of the API Gateway"
  value       = aws_apigatewayv2_api.visitor_api.api_endpoint
}
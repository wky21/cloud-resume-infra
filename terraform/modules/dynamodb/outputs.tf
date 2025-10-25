output "table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.visitor_count.name
}

output "table_arn" {
  value = aws_dynamodb_table.visitor_count.arn
}
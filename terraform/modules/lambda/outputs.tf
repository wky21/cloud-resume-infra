output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.visitor_counter.arn
}

output "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  value       = aws_lambda_function.visitor_counter.invoke_arn
}

output "lambda_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.visitor_counter.function_name
}

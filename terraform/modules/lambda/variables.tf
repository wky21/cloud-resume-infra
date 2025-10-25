variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "visitor-counter"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for visitor counts"
  type        = string
  default    = "VisitorCount"
}

variable "lambda_zip_path" {
  description = "Path to the Lambda deployment zip file"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table for Lambda"
  type        = string
}
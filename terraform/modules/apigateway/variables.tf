variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function for API Gateway integration"
  type        = string
}

variable "lambda_name" {
  description = "Name of the Lambda function for permissions"
  type        = string
}

variable "domain_name" {
  description = "Domain name for CORS configuration"
  type        = string
  default= "wilsonwongcloud.com"
}
variable "bucket_name" {
  description = "S3 bucket name for the static website"
  type        = string
  default     = "wilson-resume-bucket"
}

variable "acm_certificate_arn" {
  description = "ARN of ACM certificate for CloudFront"
  type        = string
  default     = "arn:aws:acm:us-east-1:713881830177:certificate/ef93d639-46d6-4c42-a93c-6aee97825335"
}

variable "domain_name" {
  description = "Domain name for CloudFront and Route53"
  type        = string
  default     = "wilsonwongcloud.com"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for visitor counting"
  type        = string
  default     = "VisitorCount"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "visitor_counter"
}

variable "lambda_zip_path" {
  description = "Path to the Lambda deployment zip file"
  type        = string
  default     = "./lambda/lambda.zip"
}

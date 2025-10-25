# ---------------- S3 ----------------
output "s3_bucket_name" {
  description = "The S3 bucket name / ID"
  value       = module.s3.bucket_name
}

output "s3_bucket_regional_domain_name" {
  description = "The S3 bucket regional domain name"
  value       = module.s3.bucket_regional_domain_name
}

# ---------------- CloudFront ----------------
output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.cloudfront_domain
}

# ---------------- Route53 ----------------
output "route53_alias_record" {
  description = "Route53 alias record name pointing to CloudFront"
  value       = module.route53.alias_record_name
}

# ---------------- DynamoDB ----------------
output "visitor_dynamodb_table" {
  description = "Visitor count DynamoDB table name"
  value       = module.visitor_table.table_name
}

# ---------------- Lambda ----------------
output "visitor_lambda_name" {
  description = "Visitor Lambda function name"
  value       = module.visitor_lambda.lambda_name
}

output "visitor_lambda_invoke_arn" {
  description = "Visitor Lambda function invoke ARN"
  value       = module.visitor_lambda.lambda_invoke_arn
}

# ---------------- API Gateway ----------------
output "api_gateway_endpoint" {
  description = "API Gateway endpoint URL"
  value       = module.apigateway.api_endpoint
}

# ---------------- CloudFront DNS for Route53 ----------------
output "cloudfront_domain" {
  description = "CloudFront distribution DNS name for Route53"
  value       = module.cloudfront.cloudfront_domain
}
provider "aws" {
  region = "us-east-1"
}

# ---------------- S3 Module ----------------
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

# ---------------- CloudFront Module ----------------
module "cloudfront" {
  source                     = "./modules/cloudfront"
  s3_bucket_name                  = module.s3.bucket_name
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  acm_certificate_arn        = var.acm_certificate_arn
  domain_name                 = var.domain_name
}

# ---------------- Route53 Module ----------------
module "route53" {
  source             = "./modules/route53"
  domain_name        = var.domain_name
  cloudfront_domain  = module.cloudfront.cloudfront_domain
  cloudfront_zone_id = module.cloudfront.cloudfront_zone_id
}

# ---------------- DynamoDB Module ----------------
module "visitor_table" {
  source     = "./modules/dynamodb"
  table_name = var.dynamodb_table_name
}

# ---------------- Lambda Module ----------------
module "visitor_lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  lambda_zip_path      = "${path.module}/modules/lambda/lambda.zip"
  dynamodb_table_name  = module.visitor_table.table_name
  dynamodb_table_arn   = module.visitor_table.table_arn
}

# ---------------- API Gateway Module ----------------
module "apigateway" {
  source            = "./modules/apigateway"
  lambda_invoke_arn = module.visitor_lambda.lambda_invoke_arn
  lambda_name       = module.visitor_lambda.lambda_name
  domain_name       = var.domain_name
}
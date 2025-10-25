variable "s3_bucket_name" {
    type        = string
    description = "Name of the S3 bucket to store website files"
}
variable "acm_certificate_arn" {
    type        = string
    description = "ARN of the ACM certificate for the CloudFront distribution"
}
variable "domain_name" {
    type        = string
    description = "Domain name for the CloudFront distribution"
    default = "wilsonwongcloud.com"
}

variable "bucket_regional_domain_name" {
  description = "S3 bucket regional domain name for CloudFront origin"
  type        = string
}
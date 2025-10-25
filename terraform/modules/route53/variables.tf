variable "domain_name" {
  description = "Domain name to create Route53 record for"
  type        = string
  default     = "wilsonwongcloud.com"
}

variable "zone_name" {
  description = "Hosted zone domain name"
  type        = string
  default     = "wilsonwongcloud.com"
}

variable "cloudfront_domain" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "CloudFront hosted zone ID for alias record"
  type        = string
}
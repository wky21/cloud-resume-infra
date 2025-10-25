output "cloudfront_domain" {
  value = aws_cloudfront_distribution.resume_cdn.domain_name
}

output "cloudfront_zone_id" {
  value = aws_cloudfront_distribution.resume_cdn.hosted_zone_id
}
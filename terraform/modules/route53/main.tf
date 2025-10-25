# Look up existing hosted zone
data "aws_route53_zone" "resume" {
  name         = var.zone_name
  private_zone = false
}

# Route 53 alias record for domain -> CloudFront
resource "aws_route53_record" "resume_alias" {
  zone_id = data.aws_route53_zone.resume.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
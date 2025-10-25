output "alias_record_name" {
  description = "ID of the Route53 alias record"
  value       = aws_route53_record.resume_alias.id
}

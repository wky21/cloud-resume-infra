output "bucket_name" {
  value = aws_s3_bucket.resume.id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.resume.bucket_regional_domain_name
}

# Run once to create s3 and dyanamo db for remote backend and locking
# S3 bucket for Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = "cloud-resume-wky-tf-state"

  lifecycle {
    prevent_destroy = true
  }
}

# Enable versioning (new style)
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Configure remote backend and locking
terraform {
  backend "s3" {
    bucket         = "cloud-resume-wky-tf-state"
    key            = "remote/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
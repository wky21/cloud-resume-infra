# IAM role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "resume-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# IAM policy for Lambda
resource "aws_iam_role_policy" "lambda_policy" {
  name = "resume-lambda-policy"
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["dynamodb:UpdateItem","dynamodb:GetItem","dynamodb:PutItem"]
        Resource = var.dynamodb_table_arn
      },
      {
        Effect   = "Allow"
        Action   = ["logs:CreateLogGroup","logs:CreateLogStream","logs:PutLogEvents"]
        Resource = "*"
      }
    ]
  })
}

# Lambda function
resource "aws_lambda_function" "visitor_counter" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.10"
  handler       = "visitor_counter.lambda_handler"
  filename      = var.lambda_zip_path

  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }
}
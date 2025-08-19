locals {
  name = var.project_name
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "${local.name}-tfstate-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "${local.name}-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute { name = "LockID" type = "S" }
}

data "aws_caller_identity" "current" {}

output "backend_bucket" { value = aws_s3_bucket.tf_state.bucket }
output "backend_dynamodb_table" { value = aws_dynamodb_table.tf_lock.name }

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

data "aws_caller_identity" "current" {}

output "backend_bucket" { value = aws_s3_bucket.tf_state.bucket }

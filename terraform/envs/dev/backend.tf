terraform {
  backend "s3" {
    bucket         = "CHANGE_ME_BUCKET"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "CHANGE_ME_DDB_TABLE"
    encrypt        = true
  }
}

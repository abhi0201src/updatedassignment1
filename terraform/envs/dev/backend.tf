terraform {
  backend "s3" {
    bucket         = "CHANGE_ME_BUCKET"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}

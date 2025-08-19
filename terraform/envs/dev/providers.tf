terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.24"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Configure the Kubernetes provider after `terraform apply` using the cluster outputs
# (usually set via `KUBECONFIG` or using `aws eks update-kubeconfig` in CI).

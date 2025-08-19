# AWS infra scaffold for EKS/ECR

This scaffold includes:
- ECR repo to push images
- EKS cluster for workloads
- Kubernetes namespace and basic Deployment/Service manifests

Usage (dev environment):
1. Configure backend in `envs/dev/backend.tf` (S3 bucket, key, region) or remove it to use local state.
2. Set AWS credentials in your environment.
3. `cd terraform/envs/dev && terraform init && terraform apply`.
4. Build and push images to ECR, then deploy k8s manifests in `terraform/k8s/` via kubectl or a CI pipeline.

Notes:
- EKS module uses `terraform-aws-modules/eks/aws`.
- Replace placeholder ECR image URIs in k8s manifests when your repos are created.

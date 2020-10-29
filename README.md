# terraform-kubernetes-ingress

## Deploys Contour Ingress Controller and Cert-Manger with Let's Encrypt

This Terraform module deploys a Kubernetes cluster on Azure using AKS (Azure Kubernetes Service) and adds support for monitoring with Log Analytics.

## Usage

```hcl
provider "kubectl" {
}

module "ingress" {
  source                    = "porscheinformatik/kubernetes/ingress"
  letsencrypt_staging_email = "my.email@comany.com"
  letsencrypt_prod_email    = "my.email@comany.com"
}
```

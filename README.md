# Terraform module for Contour Ingress

Deploys Contour Ingress Controller and Cert-Manger with Let's Encrypt.

## Usage

```hcl
provider "helm" {
}

module "ingress" {
  source                    = "porscheinformatik/ingress/helm"
  letsencrypt_staging_email = "my.email@comany.com"
  letsencrypt_prod_email    = "my.email@comany.com"
}
```

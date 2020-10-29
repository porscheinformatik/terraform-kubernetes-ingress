resource "kubectl_manifest" "contour" {
  yaml_body = file("${path.module}/ingress/contour.yaml")
}

resource "kubectl_manifest" "cert_manager" {
  yaml_body = file("${path.module}/ingress/cert-manager.yaml")
}

resource "kubectl_manifest" "letsencrypt_staging" {
  yaml_body = templatefile("${path.module}/ingress/letsencrypt-staging.yaml", { email = var.letsencrypt_staging_email })
  depends_on = [
    kubectl_manifest.cert_manager,
  ]
}

resource "kubectl_manifest" "letsencrypt_prod" {
  yaml_body = templatefile("${path.module}/ingress/letsencrypt-prod.yaml", { email = var.letsencrypt_prod_email })
  depends_on = [
    kubectl_manifest.cert_manager,
  ]
}

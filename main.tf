resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.0.4"
  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "contour" {
  name             = "contour"
  chart            = "${path.module}/charts/contour"
  namespace        = "projectcontour"
  create_namespace = true
  set {
    name  = "letsencryptStagingEmail"
    value = var.letsencrypt_staging_email
  }
  set {
    name  = "letsencryptProdEmail"
    value = var.letsencrypt_prod_email
  }
  depends_on = [
    helm_release.cert_manager
  ]
}

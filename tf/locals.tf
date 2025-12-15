locals {
  # renovate: depName=argo-cd datasource=helm registryUrl=https://argoproj.github.io/argo-helm
  argocd_version           = "7.7.10"
  # renovate: depName=external-secrets datasource=helm registryUrl=https://charts.external-secrets.io
  external_secrets_version = "0.11.0"
  # renovate: depName=trust-manager datasource=helm registryUrl=https://charts.jetstack.io
  trust_manager_version    = "v0.14.0"
  # renovate: depName=cert-manager datasource=helm registryUrl=https://charts.jetstack.io
  cert_manager_version     = "v1.16.2"
  # renovate: depName=linkerd-crds datasource=helm registryUrl=https://helm.linkerd.io/stable
  linkerd-crds_version     = "1.8.0"
  # renovate: depName=linkerd-control-plane datasource=helm registryUrl=https://helm.linkerd.io/stable
  linkerd_version          = "1.16.11"
  # renovate: depName=traefik datasource=helm registryUrl=https://traefik.github.io/charts
  traefik_version          = "34.5.0"
  # renovate: depName=aks datasource=custom.aksver registryUrl=https://aksver.k8sj.io/eastus
  kubernetes_version       = "1.26.10"
}

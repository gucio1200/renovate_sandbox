locals {
  argo_host                = "argocd.${var.foundations.region_short}.${var.environment}.ecostruxure-building-operation-aas.se.app"
  argo_repo_url            = https://github.schneider-electric.com/EBOaaS/eboaas-envs-argocd.git
  traefik_address          = cidrhost(data.azurerm_subnet.main[var.main_subnet].address_prefix, -2)
  vaultUrl                 = data.azurerm_key_vault.main.vault_uri
  client-id                = data.azurerm_client_config.current.client_id
  tenant-id                = data.azurerm_client_config.current.tenant_id

  # renovate: depName=argo-cd datasource=helm registryUrl=https://argoproj.github.io/argo-helm
  argocd_version           = "7.8.2"

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
  traefik_version          = "33.2.1"
}

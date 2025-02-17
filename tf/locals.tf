locals {
  argo_host                = "argocd.${var.foundations.region_short}.${var.environment}.ecostruxure-building-operation-aas.se.app"
  argo_repo_url            = https://github.schneider-electric.com/EBOaaS/eboaas-envs-argocd.git
  traefik_address          = cidrhost(data.azurerm_subnet.main[var.main_subnet].address_prefix, -2)
  vaultUrl                 = data.azurerm_key_vault.main.vault_uri
  client-id                = data.azurerm_client_config.current.client_id
  tenant-id                = data.azurerm_client_config.current.tenant_id

  # renovate: depName=argoproj/argo-helm datasource=github-releases
  argocd_version           = "7.7.10"

  # renovate: depName=external-secrets/external-secrets datasource=github-releases
  external_secrets_version = "0.11.0"

  # renovate: depName=cert-manager/trust-manager datasource=github-releases
  trust_manager_version    = "v0.14.0"

  # renovate: depName=cert-manager/cert-manager datasource=github-releases
  cert_manager_version     = "v1.16.2"

  # renovate: depName=linkerd/linkerd2 datasource=github-releases
  linkerd-crds_version     = "1.8.0"

  # renovate: depName=linkerd/linkerd2 datasource=github-releases
  linkerd_version          = "v18.9.1"

  # renovate: depName=traefik/traefik-helm-chart datasource=github-releases
  traefik_version          = "33.2.1"
}

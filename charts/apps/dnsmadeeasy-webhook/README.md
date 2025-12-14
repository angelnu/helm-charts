# dnsmadeeasy-webhook

![Version: 5.0.0](https://img.shields.io/badge/Version-5.0.0-informational?style=flat-square) ![AppVersion: v1.8.1](https://img.shields.io/badge/AppVersion-v1.8.1-informational?style=flat-square)

Cert-Manager Webhook for DNSMadeEasy

**Homepage:** <https://github.com/angelnu/helm-charts/tree/main/charts/apps/dnsmadeeasy-webhook>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/angelnu/dnsmadeeasy-webhook>
* <https://cert-manager.io>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |
| https://charts.jetstack.io | cert-manager | v1.18.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.enabled | bool | `false` | Install cert-manager chart as dependency. Usually this is already installed in the cluster and not needed. |
| certManager.namespace | string | `"cert-manager"` | Namespace where the cert-manager operator was installed to |
| certManager.serviceAccountName | string | `"cert-manager"` | Service account used by the cert-manager |
| generateCerts | bool | `true` | Generate dedicated certs instead of re-using the cert-manager webhook certificate. |
| groupName | string | `"acme.mycompany.com"` | The GroupName here is used to identify your company or business unit that created this webhook. This name will need to be referenced in each Issuer's `webhook` stanza to inform cert-manager of where to send ChallengePayload resources in order to solve the DNS01 challenge. This group name should be **unique**, hence using your own company's domain here is recommended. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/angelnu/dnsmadeeasy-webhook"` | Image repository |
| image.tag | string | `"v1.9.0"` | Image tag |
| serviceAccount.create | bool | `true` | Create service account |


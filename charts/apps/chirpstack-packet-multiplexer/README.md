# chirpstack-packet-multiplexer

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| backend_hosts[0] | string | `"router.eu.thethings.network:1700"` |  |
| fullnameOverride | string | `""` |  |
| gateway_ids | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/angelnu/chirpstack-packet-multiplexer"` |  |
| image.tag | string | `"d8b5ed08c5fff375cd60d7a1af302d0a4237237c"` |  |
| imagePullSecrets | list | `[]` |  |
| log_level | int | `4` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.loadBalancerIP | string | `nil` |  |
| service.port | int | `1700` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

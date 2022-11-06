# reverse-proxy

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![AppVersion: 1.2.0](https://img.shields.io/badge/AppVersion-1.2.0-informational?style=flat-square)

Creates ingress reverse-proxies for external hosts with minimum boilerplate

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/reverse-proxy>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://kubernetes.io/docs/concepts/services-networking/ingress/>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| connectionTest.readtimeout | int | `2` | second to wait in case no data is received and then try again |
| connectionTest.tries | int | `30` | tries to connect |
| connectionTest.waitretry | int | `2` | seconds to wait before next retry |
| generateTLS.enabled | bool | `true` | Enable automatic generation of ingress TLS section based on ingress.hosts.*.host |
| generateTLS.secretName | string | default ingress TLS certificate | certificate to use |
| ingressPort.http | int | `80` | Ingress port for non-TLS |
| ingressPort.tls | int | `443` | Ingress port for TLS |
| instances[0].enabled | bool | true | enable this reverse proxy. |
| instances[0].externalName | string | `"google.com"` | host name behind this reverse proxy |
| instances[0].ingress.annotations | object | `{}` | Provide additional annotations which may be required |
| instances[0].ingress.hosts[0].host | string | `"example.cluster.local"` |  |
| instances[0].ingress.hosts[0].path | string | / | Path.  Helm template can be passed |
| instances[0].ingress.tls | list | `[{"hosts":["example.cluster.local"],"secretName":null}]` | Configure TLS for the ingress. Both secretName and hosts can process a Helm template. if not set the generateTLS settigs are used |
| instances[0].ip | string | `"192.168.1.1"` | IP address behind this reverse proxy Has no effect if externalName is set |
| instances[0].name | string | `"example"` |  |
| instances[0].port | int | 80 | Port used by host behind this reverse proxy |
| instances[0].test | bool | true | add a test for this reverse proxy. It can be tested with `helm test <chart_name>` |

----------------------------------------------

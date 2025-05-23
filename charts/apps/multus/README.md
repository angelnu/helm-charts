# multus

![Version: 5.0.7](https://img.shields.io/badge/Version-5.0.7-informational?style=flat-square) ![AppVersion: v4.0.1](https://img.shields.io/badge/AppVersion-v4.0.1-informational?style=flat-square)

multus CNI allows multiple NICs per pod

**Homepage:** <https://github.com/angelnu/helm-charts/tree/master/charts/stable/multus>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/k8snetworkplumbingwg/multus-cni>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cni.image.pullPolicy | string | `"IfNotPresent"` | CNI installer pull policy |
| cni.image.repository | string | `"ghcr.io/k8s-at-home/cni-plugins"` | CNI installer repostory |
| cni.image.tag | string | `"v1.1.1"` | CNI installer tag |
| cni.logLevel | string | `"verbose"` | CNI log level |
| cni.paths.bin | string | `"/var/lib/rancher/k3s/data/current/bin"` | CNI plugin binaries folder for k3s. Change to `/opt/cni/bin` for non k3s |
| cni.paths.config | string | `"/var/lib/rancher/k3s/agent/etc/cni/net.d"` | CNI config folder for k3s. Change to `/etc/cni/net.d` for non k3s |
| cni.version | string | `"0.3.1"` | CNI interface version |
| hostPID | bool | `true` |  |
| hostPaths.netns | string | `"/run/netns/"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | multus installer pull policy |
| image.repository | string | `"ghcr.io/k8snetworkplumbingwg/multus-cni"` | multus installer repostory |
| image.tag | string | `"{{ .Chart.AppVersion }}-thick"` | multus installer tag |

----------------------------------------------

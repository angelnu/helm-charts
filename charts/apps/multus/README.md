# multus

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![AppVersion: v3.7.1](https://img.shields.io/badge/AppVersion-v3.7.1-informational?style=flat-square)

multus CNI allows multiple NICs per pod

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/multus>

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
| https://bjw-s.github.io/helm-charts | common | 1.3.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cni.image.pullPolicy | string | `"IfNotPresent"` | CNI installer pull policy |
| cni.image.repository | string | `"ghcr.io/k8s-at-home/cni-plugins"` | CNI installer repostory |
| cni.image.tag | string | `"v1.1.1"` | CNI installer tag |
| cni.paths.bin | string | `"/var/lib/rancher/k3s/data/current/bin"` | CNI plugin binaries folder for k3s. Change to `/opt/cni/bin` for non k3s |
| cni.paths.config | string | `"/var/lib/rancher/k3s/agent/etc/cni/net.d"` | CNI config folder for k3s. Change to `/etc/cni/net.d` for non k3s |
| cni.version | string | `"0.3.1"` | CNI interface version |
| image.pullPolicy | string | `"IfNotPresent"` | multus installer pull policy |
| image.repository | string | `"ghcr.io/k8snetworkplumbingwg/multus-cni"` | multus installer repostory |
| image.tag | string | `"v3.9.2"` | multus installer tag |

----------------------------------------------

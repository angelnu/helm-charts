# chirpstack-packet-multiplexer

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Multiplexer for lorawan gateway packages

**Homepage:** <https://github.com/angelnu/helm-charts/tree/main/charts/apps/chirpstack-packet-multiplexer>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/angelnu/chirpstack-packet-multiplexer>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 0.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backend_hosts | list | `["eu1.cloud.thethings.network:1700"]` | where to send the packages to |
| gateway_ids | list | `[]` | IDs of the gateways sending packages to this server |
| image.repository | string | `"ghcr.io/angelnu/chirpstack-packet-multiplexer"` | image repository |
| log_level | int | `4` | log level |
| service | object | See below. | Configure the services for the chart here. |


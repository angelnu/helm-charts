# games-on-whales

![Version: 1.9.0](https://img.shields.io/badge/Version-1.9.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Streams graphic applications/games (retroarch, firefox, steam) runing on Kubernetes

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/games-on-whales>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <gits@angelnu.com> |  |
| ABeltramo | <beltramo.ale@gmail.com> |  |

## Source Code

* <https://github.com/games-on-whales/gow>

## Requirements

Kubernetes: `>=1.19.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 0.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| firefox.enabled | bool | `true` | enable/disable firefox container |
| firefox.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| firefox.image.repository | string | `"andrewmackrodt/firefox-x11"` | image repository |
| firefox.image.tag | string | `"101.0.1-r1"` | image tag |
| firefox.logLevel | string | `"info"` | firefox log level |
| firefox.volumeMounts | list | `[]` | firefox extra volume mounts |
| graphic_resources | object | `nil` | Pass GPU resources to Xorg, steam and retroarch containers See Custom configuration section in the Readme |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mkhomeretrodirs.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| mkhomeretrodirs.image.repository | string | `"busybox"` | image repository |
| mkhomeretrodirs.image.tag | string | `"1.34.0"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| pulse | object | See values.yaml | Configure pulse audio settings |
| pulseaudio.image.pullPolicy | string | `"IfNotPresent"` | pulseaudio image pull policy |
| pulseaudio.image.repository | string | `"ghcr.io/games-on-whales/pulseaudio"` | pulseaudio image repository |
| pulseaudio.image.tag | string | `"1.0.0"` | pulseaudio image tag |
| retroarch.enabled | bool | `true` | enable/disable retroarch container |
| retroarch.image.pullPolicy | string | `"IfNotPresent"` | retroarch image pull policy |
| retroarch.image.repository | string | `"ghcr.io/games-on-whales/retroarch"` | retroarch image repository |
| retroarch.image.tag | string | `"1.0.0"` | retroarch image tag |
| retroarch.logLevel | string | `"info"` | retroarch log level |
| retroarch.volumeMounts | list | `[]` | retroarch extra volume mounts |
| service.main | object | See values.yaml | Enable and configure TCP service settings for the chart under this key. |
| service.udp | object | See values.yaml | Enable and configure UDP service settings for the chart under this key. |
| steam.enabled | bool | `true` | enable/disable steam container |
| steam.image.pullPolicy | string | `"IfNotPresent"` | steam image pull policy |
| steam.image.repository | string | `"ghcr.io/games-on-whales/steam"` | steam image repository |
| steam.image.tag | string | `"1.0.0"` | steam image tag |
| steam.protonLog | int | `1` | enable proton log |
| steam.volumeMounts | list | `[]` | steam extra volume mounts |
| sunshine.env | object | `{}` | sunshine additional env settings |
| sunshine.image.pullPolicy | string | `"IfNotPresent"` | sunshine image pull policy |
| sunshine.image.repository | string | `"ghcr.io/games-on-whales/sunshine"` | sunshine image repository |
| sunshine.image.tag | string | `"1.0.0"` | sunshine image tag |
| sunshine.logLevel | string | `"info"` | sunshine log level |
| sunshine.password | string | `"admin"` | sunshine web interface pasword |
| sunshine.user | string | `"admin"` | sunshine web interface user |
| xorg.display | string | `":99"` | xorg display ID |
| xorg.image.pullPolicy | string | `"IfNotPresent"` | xorg image pull policy |
| xorg.image.repository | string | `"ghcr.io/games-on-whales/xorg"` | xorg image repository |
| xorg.image.tag | string | `"1.0.0"` | xorg image tag |
| xorg.refreshrate | int | `60` | xorg refresh rate |
| xorg.resolution | string | `"1920x1080"` | xorg resolution |

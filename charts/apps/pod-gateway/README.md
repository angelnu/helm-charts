# pod-gateway

![Version: 6.5.1](https://img.shields.io/badge/Version-6.5.1-informational?style=flat-square) ![AppVersion: v1.8.1](https://img.shields.io/badge/AppVersion-v1.8.1-informational?style=flat-square)

Admision controller to change the default gateway and DNS server of PODs.
It is typically used to route PODs through a VPN server.

**Homepage:** <https://github.com/angelnu/charts/tree/master/charts/stable/pod-gateway>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/angelnu/gateway-admision-controller>
* <https://github.com/angelnu/pod-gateway>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| DNS | string | `"172.16.0.1,172.16.0.2"` | Comma-separated IP addresses of the DNS servers within the vxlan tunnel. All mutated PODs will get this as their DNS servers. It must match VXLAN_GATEWAY_IP in settings.sh |
| DNSPolicy | string | `"None"` | The DNSPolicy to apply to the POD. Only when set to "None" will the DNS value above apply. To avoid altering POD DNS (i.e., to allow initContainers to use DNS before the the VXLAN is up), set to "ClusterFirst" |
| addons.vpn.enabled | bool | `false` | Enable the VPN if you want to route through a VPN. You might also want to set VPN_BLOCK_OTHER_TRAFFIC to true for extra safeness in case the VPN does connect |
| addons.vpn.networkPolicy.egress[0].ports[0].port | int | `1194` |  |
| addons.vpn.networkPolicy.egress[0].ports[0].protocol | string | `"UDP"` |  |
| addons.vpn.networkPolicy.egress[0].to[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| addons.vpn.networkPolicy.egress[1].to[0].ipBlock.cidr | string | `"10.0.0.0/8"` |  |
| addons.vpn.networkPolicy.enabled | bool | `true` |  |
| addons.vpn.type | string | `"openvpn"` |  |
| clusterName | string | `"cluster.local"` | cluster name used to derive the gateway full name |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy of the gateway and inserted helper cotainers |
| image.repository | string | `"ghcr.io/angelnu/pod-gateway"` | image repository of the gateway and inserted helper containers |
| image.tag | string | chart.appVersion | image tag of the gateway and inserted helper containers |
| publicPorts | string | `nil` | settings to expose ports, usually through a VPN provider. NOTE: if you change it you will need to manually restart the gateway POD |
| publicPortsV6 | string | `nil` | settings to expose ports with IPv6, usually through a VPN provider. NOTE: if you change it you will need to manually restart the gateway POD |
| routed_namespaces | list | `[]` | Namespaces that might contain routed PODs and therefore require a copy of the gneerated settings configmap. |
| settings.DNS_LOCAL_CIDRS | string | `"local"` | DNS queries to these domains will be resolved by K8S DNS instead of the default (typcally the VPN client changes it) |
| settings.NOT_ROUTED_TO_GATEWAY_CIDRS | string | `""` | IPs not sent to the POD gateway but to the default K8S. Multiple CIDRs can be specified using blanks as separator. Example for Calico: ""172.22.0.0/16 172.24.0.0/16"  This is needed, for example, in case your CNI does not add a non-default rule for the K8S addresses (Flannel does). |
| settings.VPN_BLOCK_OTHER_TRAFFIC | bool | `false` | Prevent non VPN traffic to leave the gateway |
| settings.VPN_INTERFACE | string | `"tun0"` | If using a VPN, interface name created by it |
| settings.VPN_LOCAL_CIDRS | string | `"10.0.0.0/8 192.168.0.0/16"` | Traffic to these IPs will be send through the K8S gateway |
| settings.VPN_TRAFFIC_PORT | int | `1194` | If VPN_BLOCK_OTHER_TRAFFIC is true, allow VPN traffic over this port |
| settings.VXLAN_GATEWAY_FIRST_DYNAMIC_IP | int | `20` | Keep a range of IPs for static assignment in nat.conf |
| settings.VXLAN_ID | int | `42` | Vxlan ID to use |
| settings.VXLAN_IP_NETWORK | string | `"172.16.0"` | VXLAN needs an /24 IP range not conflicting with K8S and local IP ranges |
| webhook | object | See below | The webhook is used to mutate the PODs matching the given namespace labels. It inserts an init and sidecard helper containers that connect to the gateway pod created by this chart. |
| webhook.gatewayAnnotation | string | `"setGateway"` | annotation name to check when evaluating POD. If true the POD will get the gateway. If not set setGatewayDefault will apply. |
| webhook.gatewayAnnotationValue | string | `nil` | annotation value to check when evaluating POD. If set, the POD with gatewayAnnotation'value that matches, will get the gateway. If not set gatewayAnnotation boolean value will apply. |
| webhook.gatewayDefault | bool | `true` | default behviour for new PODs in the evaluated namespace |
| webhook.gatewayLabel | string | `"setGateway"` | label name to check when evaluating POD. If true the POD will get the gateway. If not set setGatewayDefault will apply. |
| webhook.gatewayLabelValue | string | `nil` | label value to check when evaluating POD. If set, the POD with the gatewayLabel's value that matches, will get the gateway. If not set gatewayLabel boolean value will apply. |
| webhook.image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy of the webhook |
| webhook.image.repository | string | `"ghcr.io/angelnu/gateway-admision-controller"` | image repository of the webhook |
| webhook.image.tag | string | `"v3.9.0"` | image tag of the webhook |
| webhook.namespaceSelector | object | `{"custom":{},"label":"routed-gateway","type":"label"}` | Selector for namespace. All pods in this namespace will get evaluated by the webhook. **IMPORTANT**: Do not select the namespace where the webhook is deployed to or you will get locking issues. |
| webhook.replicas | int | `1` | number of webhook instances to deploy |
| webhook.strategy | object | `{"type":"RollingUpdate"}` | strategy for updates |

----------------------------------------------

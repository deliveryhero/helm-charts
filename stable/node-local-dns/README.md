# node-local-dns

![Version: 2.1.0](https://img.shields.io/badge/Version-2.1.0-informational?style=flat-square) ![AppVersion: 1.23.1](https://img.shields.io/badge/AppVersion-1.23.1-informational?style=flat-square)

A chart to install node-local-dns.

NodeLocal DNSCache improves Cluster DNS performance by running a DNS caching agent on cluster nodes as a DaemonSet.

In today's architecture, Pods in 'ClusterFirst' DNS mode reach out to a kube-dns serviceIP for DNS queries. This is translated to a kube-dns/CoreDNS endpoint via iptables rules added by kube-proxy. With this new architecture, Pods will reach out to the DNS caching agent running on the same node, thereby avoiding iptables DNAT rules and connection tracking. The local caching agent will query kube-dns service for cache misses of cluster hostnames ("cluster.local" suffix by default).

Further documentation is [here](https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/)

This helm chart works for both kube-proxy setups (iptables or ipvs).

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/node-local-dns
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/node-local-dns
```

To install with some set values:

```console
helm install my-release deliveryhero/node-local-dns --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/node-local-dns -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.bindIp | bool | `false` | If false, it will bind 0.0.0.0, otherwise dnsServer and localDns will be used. https://github.com/bottlerocket-os/bottlerocket/issues/3711#issuecomment-1907087528 |
| config.commProtocol | string | `"force_tcp"` | Set communication protocol. Options are `prefer_udp` or `force_tcp` |
| config.customConfig | string | `""` | Overrides the generated configuration with specified one. |
| config.customUpstreamsvc | string | `""` | Use a custom upstreamsvc for -upstreamsvc |
| config.dnsDomain | string | `"cluster.local"` | Internal k8s DNS domain |
| config.dnsServer | string | `"172.20.0.10"` | Main coredns service (kube-dns) ip, used on iptables-mode. |
| config.healthPort | int | `8080` | Port used for the health endpoint |
| config.localDns | string | `"169.254.20.25"` |  |
| config.noIPv6Lookups | bool | `false` | If true, return NOERROR when attempting to resolve an IPv6 address |
| config.prefetch | object | `{"amount":3,"duration":"30s","enabled":false,"percentage":"20%"}` | If enabled, coredns will prefetch popular items when they are about to be expunged from the cache. https://coredns.io/plugins/cache/ |
| config.setupInterface | bool | `true` |  |
| config.setupIptables | bool | `true` |  |
| config.skipTeardown | bool | `false` |  |
| daemonsetAnnotations | object | `{}` |  |
| daemonsetLabels | object | `{}` |  |
| dashboard | object | `{"annotations":{},"enabled":false,"label":"grafana_dashboard","namespace":"kube-system"}` | https://github.com/grafana/helm-charts/blob/main/charts/grafana/README.md |
| dashboard.label | string | `"grafana_dashboard"` | label that grafana sidecar is configured to look for |
| dashboard.namespace | string | `"kube-system"` | namespace where grafana sidecar is configured to look for dashboards. e.g. "monitoring" |
| fullnameOverride | string | `""` |  |
| image.repository | string | `"registry.k8s.io/dns/k8s-dns-node-cache"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| prometheusScraping.enabled | bool | `true` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| service.annotations | object | `{}` | Annotations to add to the service. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template. |
| serviceMonitor | object | `{"enabled":false,"honorLabels":false,"labels":{},"metricRelabelings":[],"path":"/metrics","relabelings":[]}` | https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/getting-started.md |
| serviceMonitor.enabled | bool | `false` | Ensure that servicemonitor is created, this will disable prometheus annotations |
| serviceMonitor.metricRelabelings | list | `[]` | Metric relabel configs to apply to samples before ingestion. [Metric Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#metric_relabel_configs) |
| serviceMonitor.relabelings | list | `[]` | Relabel configs to apply to samples before ingestion. [Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config) |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| gabrieladt | <no-reply@deliveryhero.com> |  |

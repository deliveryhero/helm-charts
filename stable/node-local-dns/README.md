# node-local-dns

![Version: 2.0.8](https://img.shields.io/badge/Version-2.0.8-informational?style=flat-square) ![AppVersion: 1.22.23](https://img.shields.io/badge/AppVersion-1.22.23-informational?style=flat-square)

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
| config.bindIp | bool | `false` |  |
| config.commProtocol | string | `"force_tcp"` |  |
| config.customConfig | string | `""` |  |
| config.customUpstreamsvc | string | `""` |  |
| config.dnsDomain | string | `"cluster.local"` |  |
| config.dnsServer | string | `"172.20.0.10"` |  |
| config.healthPort | int | `8080` |  |
| config.localDns | string | `"169.254.20.25"` |  |
| config.setupInterface | bool | `true` |  |
| config.setupIptables | bool | `true` |  |
| config.skipTeardown | bool | `false` |  |
| daemonsetAnnotations | object | `{}` |  |
| daemonsetLabels | object | `{}` |  |
| dashboard.annotations | object | `{}` |  |
| dashboard.enabled | bool | `false` |  |
| dashboard.label | string | `"grafana_dashboard"` |  |
| dashboard.namespace | string | `"kube-system"` |  |
| fullnameOverride | string | `""` |  |
| image.repository | string | `"registry.k8s.io/dns/k8s-dns-node-cache"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| prometheusScraping.enabled | bool | `true` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.honorLabels | bool | `false` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.path | string | `"/metrics"` |  |
| serviceMonitor.relabelings | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| gabrieladt | <no-reply@deliveryhero.com> |  |

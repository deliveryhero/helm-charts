# node-local-dns

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)

A chart to install node-local-dns.
NodeLocal DNSCache improves Cluster DNS performance by running a DNS caching agent on cluster nodes as a DaemonSet.
In today's architecture, Pods in 'ClusterFirst' DNS mode reach out to a kube-dns serviceIP for DNS queries.
This is translated to a kube-dns/CoreDNS endpoint via iptables rules added by kube-proxy.
With this new architecture, Pods will reach out to the DNS caching agent running on the same node, thereby avoiding iptables DNAT rules and connection tracking.
The local caching agent will query kube-dns service for cache misses of cluster hostnames ("cluster.local" suffix by default).[docs](https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/)

This helm chart works for both Kube-proxy setups (iptables or ipvs).

 ```console
 helm install -n kube-system node-local-dns deliveryhero/node-local-dns
 ```

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
| fullnameOverride | string | `""` |  |
| image.repository | string | `"k8s.gcr.io/dns/k8s-dns-node-cache"` |  |
| image.tag | string | `"1.21.1"` |  |
| nameOverride | string | `""` |  |
| pillar_dns_domain | string | `"cluster.local"` |  |
| pillar_dns_server | string | `"172.20.0.10"` |  |
| pillar_local_dns | string | `"169.254.20.25"` |  |
| podAnnotations | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| gabrieladt | no-reply@deliveryhero.com |  |

# node-local-dns

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

**Homepage:** <https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/>

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
| image.repository | string | `"k8s.gcr.io/dns/k8s-dns-node-cache"` |  |
| image.tag | string | `"1.21.1"` |  |
| pillar_dns_domain | string | `"cluster.local"` | Internal k8s internal domain |
| pillar_dns_server | string | `"172.20.0.10"` | Main coredns service (kube-dns) ip, used on iptables-mode |
| pillar_local_dns | string | `"169.254.20.25"` | Virtual IP to be used by ipvs mode, to be used as --cluster-dns, must not collide |
| nameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` | Any extra annotations to apply |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` | Any extra annotations to apply |


## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Gabriel Ferreira | no-reply@deliveryhero.com |  |

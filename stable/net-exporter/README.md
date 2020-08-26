# net-exporter

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.2.1](https://img.shields.io/badge/AppVersion-1.2.1-informational?style=flat-square)

net-exporter is a Prometheus exporter for exposing network information in Kubernetes clusters. It is packaged as a Helm chart.

net-exporter runs as a Kubernetes Daemonset. This is to allow for intra-pod network calls, to determine network latency.

**Homepage:** <https://github.com/giantswarm/net-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
```

A simple install with default values:

```console
helm install deliveryhero/net-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/net-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/net-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/net-exporter -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| dns.label | string | `"coredns"` |  |
| dns.port | int | `1053` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"quay.io/giantswarm/net-exporter"` |  |
| image.tag | string | `"9ce103b9d6ba1fb3c22c296f226a0a87af8148f1"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `3` |  |
| resources.limits.memory | string | `"75Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"75Mi"` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| timeout | string | `"10s"` |  |
| tolerations[0].operator | string | `"Exists"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

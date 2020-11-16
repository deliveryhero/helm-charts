# prometheus-statsd-exporter

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![AppVersion: v0.18.0](https://img.shields.io/badge/AppVersion-v0.18.0-informational?style=flat-square)

StatsD to Prometheus metrics exporter

**Homepage:** <https://github.com/prometheus/statsd_exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/prometheus-statsd-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prometheus-statsd-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/prometheus-statsd-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prometheus-statsd-exporter -f values.yaml
```

## Source Code

* <https://github.com/prometheus/statsd_exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"prom/statsd-exporter"` |  |
| image.tag | string | `"v0.18.0"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

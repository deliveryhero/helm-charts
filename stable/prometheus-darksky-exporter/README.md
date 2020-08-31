# prometheus-darksky-exporter

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: v0.0.4](https://img.shields.io/badge/AppVersion-v0.0.4-informational?style=flat-square)

A Helm chart to export Dark Sky results

**Homepage:** <https://github.com/billykwooten/darksky-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/prometheus-darksky-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prometheus-darksky-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/prometheus-darksky-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prometheus-darksky-exporter -f values.yaml
```

## Source Code

* <https://github.com/billykwooten/darksky-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.interval | string | `"10m"` |  |
| config.port | int | `9091` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"billykwooten/darksky-exporter"` |  |
| image.tag | string | `"v0.0.4"` |  |
| prometheus | bool | `true` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"50m"` |  |
| resources.limits.memory | string | `"50Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"50Mi"` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.name | string | `"http"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

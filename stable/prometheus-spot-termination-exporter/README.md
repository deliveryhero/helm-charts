# prometheus-spot-termination-exporter

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Spot instance termination exporter for Prometheus

**Homepage:** <https://github.com/banzaicloud/spot-termination-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.com/public
```

A simple install with default values:

```console
helm install deliveryhero/prometheus-spot-termination-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prometheus-spot-termination-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/prometheus-spot-termination-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prometheus-spot-termination-exporter -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.imagePullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"banzaicloud/spot-termination-exporter"` |  |
| image.tag | string | `"0.0.1"` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| logLevel | string | `"debug"` |  |
| metadataEndpoint | string | `"http://169.254.169.254/latest/meta-data/"` |  |
| nodeSelector."kubernetes.io/lifecycle" | string | `"spot"` |  |
| port | int | `9189` |  |
| prometheus.metricsPath | string | `"/metrics"` |  |
| prometheus.scrape | string | `"true"` |  |
| readinessProbe.httpGet.httpHeaders | string | `nil` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| resources.limits.cpu | string | `"120m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"120m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal | no-reply@deliveryhero.com |  |

# prometheus-spot-termination-exporter

![Version: 0.2.5](https://img.shields.io/badge/Version-0.2.5-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

Spot instance termination exporter for Prometheus

**Homepage:** <https://github.com/banzaicloud/spot-termination-exporter>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal | no-reply@deliveryhero.com |  |

## Source Code

* <https://github.com/banzaicloud/spot-termination-exporter>

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
| resources | object | `{}` |  |

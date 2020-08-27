# prometheus-soti-mobicontrol-exporter

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![AppVersion: 0.6](https://img.shields.io/badge/AppVersion-0.6-informational?style=flat-square)

A Helm chart a prometheus exporter for SOTI MobiControl metrics

**Homepage:** <https://github.com/max-rocket-internet/soti-mobicontrol-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
```

A simple install with default values:

```console
helm install deliveryhero/prometheus-soti-mobicontrol-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prometheus-soti-mobicontrol-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/prometheus-soti-mobicontrol-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prometheus-soti-mobicontrol-exporter -f values.yaml
```

## Source Code

* <https://github.com/max-rocket-internet/soti-mobicontrol-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/soti-mobicontrol-exporter"` |  |
| image.tag | float | `0.6` |  |
| imagePullSecrets | list | `[]` |  |
| logLevel | string | `"INFO"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| podAnnotations."prometheus.io/port" | string | `"9571"` |  |
| podAnnotations."prometheus.io_scrape" | string | `"true"` |  |
| podLivenessProbe.failureThreshold | int | `2` |  |
| podLivenessProbe.httpGet.path | string | `"/healthz"` |  |
| podLivenessProbe.httpGet.port | int | `9571` |  |
| podLivenessProbe.initialDelaySeconds | int | `5` |  |
| podLivenessProbe.periodSeconds | int | `30` |  |
| podLivenessProbe.timeoutSeconds | int | `5` |  |
| podReadinessProbe.failureThreshold | int | `2` |  |
| podReadinessProbe.httpGet.path | string | `"/healthz"` |  |
| podReadinessProbe.httpGet.port | int | `9571` |  |
| podReadinessProbe.initialDelaySeconds | int | `5` |  |
| podReadinessProbe.periodSeconds | int | `30` |  |
| podReadinessProbe.timeoutSeconds | int | `5` |  |
| podSecurityContext | object | `{}` |  |
| pod_labels | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| service.create | bool | `false` |  |
| sotiApi.apiConcurrency | int | `50` |  |
| sotiApi.apiPageSize | int | `1000` |  |
| sotiApi.client_id | string | `"<change-me>"` |  |
| sotiApi.client_secret | string | `"<change-me>"` |  |
| sotiApi.mobicontrol_host | string | `"<change-me>"` |  |
| sotiApi.password | string | `"<change-me>"` |  |
| sotiApi.username | string | `"<change-me>"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

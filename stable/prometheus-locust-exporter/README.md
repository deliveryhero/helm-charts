# prometheus-locust-exporter

![Version: 1.2.2](https://img.shields.io/badge/Version-1.2.2-informational?style=flat-square) ![AppVersion: v0.4.1](https://img.shields.io/badge/AppVersion-v0.4.1-informational?style=flat-square)

A Helm chart a prometheus exporter locust load test metrics

**Homepage:** <https://github.com/ContainerSolutions/locust_exporter>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-locust-exporter
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-locust-exporter --version 1.2.2
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-locust-exporter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-locust-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-locust-exporter -f values.yaml
```

## Source Code

* <https://github.com/ContainerSolutions/locust_exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.locust_timeout | string | `"5s"` | timeout when getting metrics from locust |
| config.locust_uri | string | `"http://localhost:8089"` | the locust endpoint |
| config.log_level | string | `"info"` | the log level |
| config.web_listen_address | string | `":9646"` | the address to listen on for metric serving |
| config.web_telemetry_path | string | `"/metrics"` | the path |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"containersol/locust_exporter"` |  |
| image.tag | string | `"v0.4.1"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| podAnnotations."prometheus.io/port" | string | `"9646"` |  |
| podAnnotations."prometheus.io_scrape" | string | `"true"` |  |
| podLivenessProbe.failureThreshold | int | `2` |  |
| podLivenessProbe.httpGet.path | string | `"/healthz"` |  |
| podLivenessProbe.httpGet.port | int | `9646` |  |
| podLivenessProbe.initialDelaySeconds | int | `5` |  |
| podLivenessProbe.periodSeconds | int | `30` |  |
| podLivenessProbe.timeoutSeconds | int | `5` |  |
| podReadinessProbe.failureThreshold | int | `2` |  |
| podReadinessProbe.httpGet.path | string | `"/healthz"` |  |
| podReadinessProbe.httpGet.port | int | `9646` |  |
| podReadinessProbe.initialDelaySeconds | int | `5` |  |
| podReadinessProbe.periodSeconds | int | `30` |  |
| podReadinessProbe.timeoutSeconds | int | `5` |  |
| podSecurityContext | object | `{}` |  |
| pod_labels | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `false` |  |
| service.create | bool | `false` |  |
| serviceMonitor.enabled | bool | `false` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |

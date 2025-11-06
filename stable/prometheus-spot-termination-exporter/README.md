# prometheus-spot-termination-exporter

<<<<<<< HEAD
![Version: 0.2.14](https://img.shields.io/badge/Version-0.2.14-informational?style=flat-square) ![AppVersion: 0.0.2](https://img.shields.io/badge/AppVersion-0.0.2-informational?style=flat-square)
||||||| parent of 88f2942 ([stable/prometheus-spot-termination-exporter] update chart to be more flexible)
![Version: 0.2.12](https://img.shields.io/badge/Version-0.2.12-informational?style=flat-square) ![AppVersion: 0.0.2](https://img.shields.io/badge/AppVersion-0.0.2-informational?style=flat-square)
=======
![Version: 0.2.13](https://img.shields.io/badge/Version-0.2.13-informational?style=flat-square) ![AppVersion: 0.3.0](https://img.shields.io/badge/AppVersion-0.3.0-informational?style=flat-square)
>>>>>>> 88f2942 ([stable/prometheus-spot-termination-exporter] update chart to be more flexible)

Spot instance termination exporter for Prometheus

**Homepage:** <https://github.com/banzaicloud/spot-termination-exporter>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter
```

To install a specific version of this chart:

```console
<<<<<<< HEAD
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter --version 0.2.14
||||||| parent of 88f2942 ([stable/prometheus-spot-termination-exporter] update chart to be more flexible)
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter --version 0.2.12
=======
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter --version 0.2.13
>>>>>>> 88f2942 ([stable/prometheus-spot-termination-exporter] update chart to be more flexible)
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/prometheus-spot-termination-exporter -f values.yaml
```

## Source Code

* <https://github.com/banzaicloud/spot-termination-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | list | `[]` |  |
| extraArgs | string | `nil` |  |
| extraVolumeMounts | list | `[]` |  |
| image.imagePullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"banzaicloud/spot-termination-exporter"` |  |
| image.tag | string | `"0.0.1"` |  |
| initContainers | list | `[]` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| logLevel | string | `"debug"` |  |
| metadataEndpoint | string | `"http://169.254.169.254/latest/meta-data/"` |  |
| nodeSelector."eks.amazonaws.com/capacityType" | string | `"SPOT"` |  |
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

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal |  | <https://github.com/sietevecesmal> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/prometheus-spot-termination-exporter](https://github.com/deliveryhero/helm-charts/tree/master/stable/prometheus-spot-termination-exporter)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/prometheus-spot-termination-exporter](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fprometheus-spot-termination-exporter)

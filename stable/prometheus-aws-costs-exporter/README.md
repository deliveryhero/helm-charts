# prometheus-aws-costs-exporter

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Exporter for AWS Cost Explorer daily costs

**Homepage:** <https://github.com/nachomillangarcia/prometheus_aws_cost_exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/prometheus-aws-costs-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prometheus-aws-costs-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/prometheus-aws-costs-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prometheus-aws-costs-exporter -f values.yaml
```

## Source Code

* <https://github.com/nachomillangarcia/prometheus_aws_cost_exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"--host"` |  |
| args[1] | string | `"0.0.0.0"` |  |
| environment.METRIC_TODAY_DAILY_COSTS | string | `"yes"` |  |
| environment.METRIC_TODAY_DAILY_USAGE | string | `"yes"` |  |
| environment.METRIC_TODAY_DAILY_USAGE_NORM | string | `"yes"` |  |
| environment.METRIC_YESTERDAY_DAILY_COSTS | string | `"yes"` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nachomillangarcia/prometheus_aws_cost_exporter"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"300m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |

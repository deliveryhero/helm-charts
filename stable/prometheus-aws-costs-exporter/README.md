# prometheus-aws-costs-exporter

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Exporter for AWS Cost Explorer daily costs

**Homepage:** <https://github.com/nachomillangarcia/prometheus_aws_cost_exporter>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

## Source Code

* <https://github.com/nachomillangarcia/prometheus_aws_cost_exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"--host"` |  |
| args[1] | string | `"0.0.0.0"` |  |
| environment.METRIC_TODAY_DAILY_COSTS | bool | `true` |  |
| environment.METRIC_TODAY_DAILY_USAGE | bool | `true` |  |
| environment.METRIC_TODAY_DAILY_USAGE_NORM | bool | `true` |  |
| environment.METRIC_YESTERDAY_DAILY_COSTS | bool | `true` |  |
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

# rds-downscaler

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A small python script that runs on a cron schedule and periodically downscales AWS RDS instances.

It will filter RDS instances/clusters by tag key and value.

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | max.williams@deliveryhero.com |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"python"` |  |
| image.tag | string | `"3.7.0-alpine3.8"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podLabels | object | `{}` |  |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| schedule | object | `{"hour":"20","minute":"00"}` | Cron schedule of the downscale job |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tag | object | `{"key":"environment","value":"staging"}` | AWS tag used to find RDS instances/clusters |
| tolerations | list | `[]` |  |

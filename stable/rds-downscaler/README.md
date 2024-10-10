# rds-downscaler

![Version: 1.0.4](https://img.shields.io/badge/Version-1.0.4-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A small python script that runs on a cron schedule and periodically downscales AWS RDS instances.

It will filter RDS instances/clusters by tag key and value or a particular cluster specified with cluster identifier.

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/rds-downscaler
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/rds-downscaler --version 1.0.4
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/rds-downscaler
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/rds-downscaler --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/rds-downscaler -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| clusterIdentifiers | string | `""` | A comma separated string with RDS Aurora Cluster Identifiers |
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
| tag | object | `{"key":"","values":""}` | AWS tag used to find RDS instances/clusters |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <max.williams@deliveryhero.com> |  |

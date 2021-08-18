# mlflow

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for MLflow

**Homepage:** <https://www.mlflow.org/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/mlflow
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/mlflow
```

To install with some set values:

```console
helm install my-release deliveryhero/mlflow --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/mlflow -f values.yaml
```

## Source Code

* <https://github.com/mlflow>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"larribas/mlflow"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts | list | `[]` |  |
| ingress.path | string | `"/"` |  |
| mlflow.affinity | object | `{}` |  |
| mlflow.autoscaling.enabled | bool | `false` |  |
| mlflow.autoscaling.maxReplicas | int | `10` |  |
| mlflow.autoscaling.minReplicas | int | `1` |  |
| mlflow.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| mlflow.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| mlflow.database.hostname | string | `"mlflow"` |  |
| mlflow.database.name | string | `"mlflow"` |  |
| mlflow.database.password | string | `"mlflow"` |  |
| mlflow.database.port | int | `5432` |  |
| mlflow.database.username | string | `"mlflow"` |  |
| mlflow.nodeSelector | object | `{}` |  |
| mlflow.replicas | int | `1` |  |
| mlflow.resources | object | `{}` |  |
| mlflow.s3.path | string | `"s3://mlflow"` |  |
| mlflow.tolerations | list | `[]` |  |
| nameOverride | string | `""` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mkuhn | magdalena.kuhn@deliveryhero.com | https://github.com/lena-kuhn |

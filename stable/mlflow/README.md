# MLflow

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for setting up a MLflow tracking server with a PostgreSQL as backend store

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
| extraConfigmapData | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"larribas/mlflow"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.enabled | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| mlflow.affinity | object | `{}` |  |
| mlflow.autoscaling.enabled | bool | `false` |  |
| mlflow.autoscaling.minReplicas | int | `1` |  |
| mlflow.autoscaling.maxReplicas | int | `10` |  |
| mlflow.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| mlflow.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| mlflow.configMountPath | string | `"/app/pythonpath"` |  |
| mlflow.containerPort | int | `8088` |  |
| mlflow.postgres.databaseEnabled | bool | `true` |  |
| mlflow.postgres.instanceID | string | `""` |  |
| mlflow.postgres.hostname | string | `""` |  |
| mlflow.postgres.port | int | `5432` |  |
| mlflow.postgres.database | string | `"mlflow"` |  |
| mlflow.postgres.user | string | `""` |  |
| mlflow.postgres.password | string | `""` |  |
| mlflow.extraConfig | string | `""` |  |
| mlflow.nodeSelector | object | `{}` |  |
| mlflow.oidc.config | string | `""` |  |
| mlflow.oidc.enabled | bool | `false` |  |
| mlflow.oidc.imports | string | `""` |  |
| mlflow.replicas | int | `1` |  |
| mlflow.resources | object | `{}` |  |
| mlflow.tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mkuhn | magdalena.kuhn@deliveryhero.com |  |

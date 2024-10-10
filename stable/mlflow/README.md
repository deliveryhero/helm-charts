# mlflow

![Version: 1.0.9](https://img.shields.io/badge/Version-1.0.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.1](https://img.shields.io/badge/AppVersion-1.9.1-informational?style=flat-square)

A Helm chart to install MLflow tracking, a tool to track Machine Learning experiments.

This Helm chart is using Postgresql as backend and S3 as artifact store.
Contributions for other backends and artifacts store are welcome.

**Homepage:** <https://www.mlflow.org/>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/mlflow
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/mlflow --version 1.0.9
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/mlflow
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/mlflow --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/mlflow -f values.yaml
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
| image.tag | string | `"1.9.1"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.enabled | bool | `false` |  |
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
| service.annotations | object | `{}` |  |
| service.https.enable | bool | `false` |  |
| service.https.port | int | `443` |  |
| service.loadBalancerSourceRanges | list | `[]` | Specifies source IP ranges which are allowed to access service with `LoadBalancer` type |
| service.port | int | `80` |  |
| service.targetPort | int | `5000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created. If true, mlflow.fullname template is used as name. |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mkuhn | <no-reply@deliveryhero.com> | <https://github.com/magdalenakuhn17> |

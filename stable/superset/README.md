# superset

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for Apache Superset

**Homepage:** <https://superset.apache.org/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/superset
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/superset
```

To install with some set values:

```console
helm install my-release deliveryhero/superset --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/superset -f values.yaml
```

## Source Code

* <https://github.com/apache/superset>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"apache/superset"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `nil` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccountName | string | `nil` |  |
| superset.admin.create | bool | `false` |  |
| superset.admin.email | string | `"admin@superset.com"` |  |
| superset.admin.firstName | string | `"superset"` |  |
| superset.admin.lastName | string | `"admin"` |  |
| superset.admin.password | string | `"admin"` |  |
| superset.admin.username | string | `"admin"` |  |
| superset.affinity | object | `{}` |  |
| superset.autoscaling.enabled | bool | `false` |  |
| superset.autoscaling.maxReplicas | int | `10` |  |
| superset.autoscaling.minReplicas | int | `1` |  |
| superset.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| superset.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| superset.celery.affinity | object | `{}` |  |
| superset.celery.autoscaling.enabled | bool | `false` |  |
| superset.celery.autoscaling.maxReplicas | int | `10` |  |
| superset.celery.autoscaling.minReplicas | int | `1` |  |
| superset.celery.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| superset.celery.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| superset.celery.enabled | bool | `false` |  |
| superset.celery.forceReload | bool | `false` |  |
| superset.celery.nodeSelector | object | `{}` |  |
| superset.celery.podAnnotations | object | `{}` |  |
| superset.celery.replicas | int | `1` |  |
| superset.celery.resources | object | `{}` |  |
| superset.celery.tolerations | list | `[]` |  |
| superset.configFile | string | `""` |  |
| superset.configMountPath | string | `"/app/pythonpath"` |  |
| superset.containerPort | int | `8088` |  |
| superset.database.create | bool | `false` |  |
| superset.database.hostname | string | `""` |  |
| superset.database.init | bool | `true` |  |
| superset.database.instanceID | string | `""` |  |
| superset.database.name | string | `""` |  |
| superset.database.password | string | `""` |  |
| superset.database.port | int | `5432` |  |
| superset.database.username | string | `""` |  |
| superset.nodeSelector | object | `{}` |  |
| superset.redis.brokerDbIndex | int | `1` |  |
| superset.redis.cacheDbIndex | int | `0` |  |
| superset.redis.host | string | `""` |  |
| superset.redis.password | string | `""` |  |
| superset.redis.port | int | `6379` |  |
| superset.replicas | int | `1` |  |
| superset.resources | object | `{}` |  |
| superset.tolerations | list | `[]` |  |
| superset.worker.affinity | object | `{}` |  |
| superset.worker.autoscaling.enabled | bool | `false` |  |
| superset.worker.autoscaling.maxReplicas | int | `10` |  |
| superset.worker.autoscaling.minReplicas | int | `1` |  |
| superset.worker.nodeSelector | object | `{}` |  |
| superset.worker.podAnnotations | object | `{}` |  |
| superset.worker.replicas | int | `1` |  |
| superset.worker.resources | object | `{}` |  |
| superset.worker.targetCPUUtilizationPercentage | int | `80` |  |
| superset.worker.tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | thomas.nyambati@deliveryhero.com |  |

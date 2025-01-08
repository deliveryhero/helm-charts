# superset

![Version: 1.1.3](https://img.shields.io/badge/Version-1.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Apache Superset

**Homepage:** <https://superset.apache.org/>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/superset
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/superset --version 1.1.3
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/superset
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/superset --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/superset -f values.yaml
```

## Source Code

* <https://github.com/apache/superset>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraConfigmapData | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"apache/superset"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
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
| superset.celery.command[0] | string | `"celery"` |  |
| superset.celery.command[1] | string | `"--app=superset.tasks.celery_app:app"` |  |
| superset.celery.command[2] | string | `"beat"` |  |
| superset.celery.command[3] | string | `"--pidfile"` |  |
| superset.celery.command[4] | string | `"/tmp/celerybeat.pid"` |  |
| superset.celery.command[5] | string | `"--schedule"` |  |
| superset.celery.command[6] | string | `"/tmp/celerybeat-schedule"` |  |
| superset.celery.enabled | bool | `true` |  |
| superset.celery.forceReload | bool | `false` |  |
| superset.celery.nodeSelector | object | `{}` |  |
| superset.celery.podAnnotations | object | `{}` |  |
| superset.celery.replicas | int | `1` |  |
| superset.celery.resources | object | `{}` |  |
| superset.celery.tolerations | list | `[]` |  |
| superset.configMountPath | string | `"/app/pythonpath"` |  |
| superset.containerPort | int | `8088` |  |
| superset.database.create | bool | `false` |  |
| superset.database.engine | string | `"postgresql+psycopg2"` |  |
| superset.database.hostname | string | `""` |  |
| superset.database.init | bool | `true` |  |
| superset.database.instanceID | string | `""` |  |
| superset.database.name | string | `""` |  |
| superset.database.password | string | `""` |  |
| superset.database.port | int | `5432` |  |
| superset.database.username | string | `""` |  |
| superset.enable_proxy_fix | bool | `true` |  |
| superset.extraConfig | string | `""` |  |
| superset.nodeSelector | object | `{}` |  |
| superset.oauth2.okta.default_admin_emails | list | `[]` |  |
| superset.oauth2.okta.enabled | bool | `false` |  |
| superset.oauth2.okta.token_key_name | string | `"access_token"` |  |
| superset.oidc.config | string | `""` |  |
| superset.oidc.enabled | bool | `false` |  |
| superset.oidc.imports | string | `""` |  |
| superset.podAnnotations | object | `{}` |  |
| superset.redis.brokerDbIndex | int | `1` |  |
| superset.redis.cacheDbIndex | int | `0` |  |
| superset.redis.default_timeout | int | `300` |  |
| superset.redis.hostname | string | `""` |  |
| superset.redis.key_prefix | string | `"superset_"` |  |
| superset.redis.password | string | `""` |  |
| superset.redis.port | int | `6379` |  |
| superset.replicas | int | `1` |  |
| superset.resources | object | `{}` |  |
| superset.tolerations | list | `[]` |  |
| superset.worker.affinity | object | `{}` |  |
| superset.worker.autoscaling.enabled | bool | `false` |  |
| superset.worker.autoscaling.maxReplicas | int | `10` |  |
| superset.worker.autoscaling.minReplicas | int | `1` |  |
| superset.worker.command[0] | string | `"celery"` |  |
| superset.worker.command[1] | string | `"--app=superset.tasks.celery_app:app"` |  |
| superset.worker.command[2] | string | `"worker"` |  |
| superset.worker.nodeSelector | object | `{}` |  |
| superset.worker.podAnnotations | object | `{}` |  |
| superset.worker.replicas | int | `1` |  |
| superset.worker.resources | object | `{}` |  |
| superset.worker.targetCPUUtilizationPercentage | int | `80` |  |
| superset.worker.tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <thomas.nyambati@deliveryhero.com> |  |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/superset](https://github.com/deliveryhero/helm-charts/tree/master/stable/superset)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/superset](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fsuperset)

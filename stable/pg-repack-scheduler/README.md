# pg-repack-scheduler

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

For running [pg_repack](https://github.com/reorg/pg_repack) as a `Job` or `CronJob`. By default the `CronJob` is disabled but a new `Job` can be created adhoc like this:

```console
kubectl create job pg-repack --from=cronjob/pg-repack-scheduler
```

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/pg-repack-scheduler
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/pg-repack-scheduler
```

To install with some set values:

```console
helm install my-release deliveryhero/pg-repack-scheduler --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/pg-repack-scheduler -f values.yaml
```

## Source Code

* <https://github.com/reorg/pg_repack>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| db_settings.database | string | `"my-db"` |  |
| db_settings.host | string | `"my-db-host.domain.com"` |  |
| db_settings.password | string | `"CHANGE_ME"` |  |
| db_settings.user | string | `"postgres"` |  |
| environment | object | `{}` | Any environment variables |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/pg-repack-scheduler"` |  |
| image.tag | string | `"0.1"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pg_repack_run_settings.cleanup | string | `"true"` |  |
| pg_repack_run_settings.detailed_logging | string | `"true"` |  |
| pg_repack_run_settings.install_maint_objects | string | `"true"` |  |
| pg_repack_run_settings.objectlist_sql | string | `"select schemaname||'.'||tablename from pg_catalog.pg_tables where schemaname = 'public'"` |  |
| pg_repack_run_settings.objectlisttype | string | `"query"` |  |
| pg_repack_run_settings.parallel_job | int | `4` |  |
| pg_repack_run_settings.type | string | `"T"` |  |
| podLabels | object | `{}` |  |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| schedule | object | `{"hour":"04","minute":"00","suspend":true}` | Cron schedule of the downscale job |
| schedule.hour | string | `"04"` | Cron schedule hour of the downscale job |
| schedule.minute | string | `"00"` | Cron schedule minute of the downscale job |
| schedule.suspend | bool | `true` | Whether to suspend (disable) the cronjob |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <max.williams@deliveryhero.com> |  |

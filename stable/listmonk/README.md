# listmonk

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.1.0](https://img.shields.io/badge/AppVersion-v2.1.0-informational?style=flat-square)

A Helm chart for listmonk application

**Homepage:** <https://github.com/knadh/listmonk>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/listmonk
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/listmonk
```

To install with some set values:

```console
helm install my-release deliveryhero/listmonk --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/listmonk -f values.yaml
```

## Source Code

* <https://github.com/knadh/listmonk>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.6.26 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| database.create | bool | `false` |  |
| database.host | string | `"listmonkdb.example.com"` |  |
| database.init | bool | `false` |  |
| database.instance_id | string | `"shared"` |  |
| database.name | string | `"listmonk"` |  |
| database.password | string | `"CHANGEME"` |  |
| database.upgrade | bool | `false` |  |
| database.username | string | `"listmonk"` |  |
| env.private.LISTMONK_app__admin_password | string | `"CHANGEME"` |  |
| env.public.LISTMONK_app__address | string | `"0.0.0.0:9090"` |  |
| env.public.LISTMONK_app__admin_username | string | `"admin"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"listmonk/listmonk"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.enable | bool | `false` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| javad-hajiani | no-reply@deliveryhero.com |  |

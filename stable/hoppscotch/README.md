# hoppscotch

![Version: 0.2.7](https://img.shields.io/badge/Version-0.2.7-informational?style=flat-square) ![AppVersion: v1.9.7](https://img.shields.io/badge/AppVersion-v1.9.7-informational?style=flat-square)

A free, fast and beautiful API request builder

**Homepage:** <https://github.com/hoppscotch/hoppscotch>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/hoppscotch
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/hoppscotch
```

To install with some set values:

```console
helm install my-release deliveryhero/hoppscotch --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/hoppscotch -f values.yaml
```

## Source Code

* <https://github.com/hoppscotch/hoppscotch>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"liyasthomas/postwoman"` |  |
| image.tag | string | `"v1.9.7"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0] | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| service.containerPort | int | `3000` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| javad-hajiani | no-reply@deliveryhero.com |  |

# newrelic-controller

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square) ![AppVersion: 0.8](https://img.shields.io/badge/AppVersion-0.8-informational?style=flat-square)

A controller for managing New Relic settings

**Homepage:** <https://github.com/max-rocket-internet/newrelic-controller>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/newrelic-controller
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/newrelic-controller
```

To install with some set values:

```console
helm install my-release deliveryhero/newrelic-controller --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/newrelic-controller -f values.yaml
```

## Source Code

* <https://github.com/max-rocket-internet/newrelic-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/newrelic-controller"` |  |
| image.tag | float | `0.8` |  |
| log_level | string | `"info"` |  |
| nameOverride | string | `""` |  |
| new_relic_api_key | string | `"your_key_here"` | Your New Relic API key |
| nodeSelector | object | `{}` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

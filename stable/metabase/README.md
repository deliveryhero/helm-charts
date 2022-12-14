# metabase

![Version: 0.13.5](https://img.shields.io/badge/Version-0.13.5-informational?style=flat-square) ![AppVersion: v0.43](https://img.shields.io/badge/AppVersion-v0.43-informational?style=flat-square)

The easy, open source way for everyone in your company to ask questions and learn from data.

**Homepage:** <http://www.metabase.com/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/metabase
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/metabase
```

To install with some set values:

```console
helm install my-release deliveryhero/metabase --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/metabase -f values.yaml
```

## Source Code

* <https://github.com/metabase/metabase>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| database.type | string | `"h2"` |  |
| emojiLogging | bool | `true` |  |
| extraContainers | list | `[]` |  |
| extraEnv | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"metabase/metabase"` |  |
| image.tag | string | `"v0.36.3"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | string | `nil` |  |
| ingress.labels | string | `nil` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | string | `nil` |  |
| jetty | string | `nil` |  |
| listen.host | string | `"0.0.0.0"` |  |
| listen.port | int | `3000` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.timeoutSeconds | int | `30` |  |
| nodeSelector | object | `{}` |  |
| password.complexity | string | `"normal"` |  |
| password.length | int | `6` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.externalPort | int | `80` |  |
| service.internalPort | int | `3000` |  |
| service.name | string | `"metabase"` |  |
| service.nodePort | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| session | object | `{}` |  |
| ssl.enabled | bool | `false` |  |
| timeZone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <no-reply@deliveryhero.com> |  |

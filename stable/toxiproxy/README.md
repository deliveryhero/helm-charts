# toxiproxy

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square) ![AppVersion: 2.1.2](https://img.shields.io/badge/AppVersion-2.1.2-informational?style=flat-square)

A TCP proxy to simulate network and system conditions for chaos and resiliency testing.

**Homepage:** <https://github.com/Shopify/toxiproxy>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/toxiproxy
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/toxiproxy
```

To install with some set values:

```console
helm install my-release deliveryhero/toxiproxy --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/toxiproxy -f values.yaml
```

## Source Code

* <https://github.com/Shopify/toxiproxy>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"-config"` |  |
| args[1] | string | `"/home/toxiproxy/proxies/config.json"` |  |
| consumer.name | string | `"example"` |  |
| deploymentAnnotations | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"shopify/toxiproxy"` |  |
| image.tag | string | `"2.1.4"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.configJsonPath | string | `"/home/toxiproxy/proxies/config.json"` |  |
| service.listeningAddress | string | `"0.0.0.0"` |  |
| service.listeningPort | int | `8474` |  |
| service.port | int | `80` |  |
| service.proxies.ports | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nreymundo | no-reply@deliveryhero.com |  |

# toxiproxy

![Version: 1.3.8](https://img.shields.io/badge/Version-1.3.8-informational?style=flat-square) ![AppVersion: 2.7.0](https://img.shields.io/badge/AppVersion-2.7.0-informational?style=flat-square)

A TCP proxy to simulate network and system conditions for chaos and resiliency testing.

By default the chart will install toxiproxy with blank configuration. You can add [toxics](https://github.com/Shopify/toxiproxy#toxics) to the running configuration using the [API](https://github.com/Shopify/toxiproxy#http-api).

For large configurations it is easier to store your toxics in a JSON file, in a `ConfigMap` and pass this to the chart to be used by toxiproxy:

```console
kubectl create configmap my-toxiproxy-config --from-file path/to/your/toxiproxy.json
```

And then install the chart passing the name of the `ConfigMap` as a value:

```console
helm install toxiproxy deliveryhero/toxiproxy --set toxiproxyConfig=my-toxiproxy-config
```

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
* <https://github.com/buckle/toxiproxy-frontend>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | string | `nil` |  |
| consumer.name | string | `"example"` |  |
| deploymentAnnotations | object | `{}` |  |
| environment | list | `[]` |  |
| extraLabels | object | `{}` |  |
| frontend.enabled | bool | `false` |  |
| frontend.ingress.annotations | object | `{}` |  |
| frontend.ingress.className | string | `""` |  |
| frontend.ingress.hosts[0].host | string | `"chart-example-ui.local"` |  |
| frontend.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| frontend.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| frontend.ingress.tls | list | `[]` |  |
| frontend.repository | string | `"buckle/toxiproxy-frontend"` |  |
| frontend.resources | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/shopify/toxiproxy"` |  |
| image.tag | string | `"2.7.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| init.image.repository | string | `"busybox"` | the docker repository and image to be used for the init container. |
| init.image.tag | string | `"latest"` | the docker image tag for the init container image |
| nameOverride | string | `""` |  |
| nodeSelector."kubernetes.io/arch" | string | `"amd64"` |  |
| nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| pdb.enabled | bool | `false` | Whether to create a PodDisruptionBudget |
| podAnnotations | object | `{}` |  |
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
| toxiproxyConfig | string | `""` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nreymundo | <no-reply@deliveryhero.com> |  |

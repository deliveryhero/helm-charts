# killgrave

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.1](https://img.shields.io/badge/AppVersion-0.4.1-informational?style=flat-square)

A chart to install [killgrave](https://github.com/friendsofgo/killgrave), a simulator for HTTP-based APIs.

In its more basic setup, this chart requires a `configmap` including all _imposters_ (the definition of a request-response pair)

## How to install this chart

A simple install with default values:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/killgrave
```

To install a specific version of this chart:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/killgrave --version <version>
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/killgrave
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/killgrave --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/killgrave -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| hpa.enabled | bool | `false` |  |
| hpa.maxReplicas | int | `100` |  |
| hpa.minReplicas | int | `1` |  |
| hpa.targetCPUUtilizationPercentage | int | `80` |  |
| hpa.targetMemoryUtilizationPercentage | bool | `false` | Set it to false in case you don't want to scale by memory consumption |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| labels | object | `{}` | Any extra label to apply to all resources |
| mock.imposters.configmap | string | `"example-imposters"` | The name of the configmap containing all your imposters |
| mock.imposters.path | string | `"/imposters"` | The mounting path for your imposters folder |
| mock.killgrave.secure | bool | `false` | If killgrave server must be configured to run using TSL |
| mock.killgrave.tag | string | `"0.4.1"` | The image tag to use |
| mock.schemas.configmap | string | `"example-schemas"` | The name of the configmap containing your schemas' folder. |
| mock.schemas.path | string | `"/schemas"` | The mounting path for your schemas folder |
| nameOverride | string | `""` | Set it in case you want to override the name of the deployment. By default it is set to `.Chart.Name` |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` | Set the number of replicas in case hpa is not enabled |
| resources | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"NodePort"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| MarceloAplanalp | <marcelo.aplanalp@deliveryhero.com> |  |

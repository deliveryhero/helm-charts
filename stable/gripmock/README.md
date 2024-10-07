# gripmock

![Version: 1.1.2](https://img.shields.io/badge/Version-1.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.10.1](https://img.shields.io/badge/AppVersion-1.10.1-informational?style=flat-square)

A chart to install [gripmock](https://github.com/tokopedia/gripmock). A mock server for GRPC services. It uses `.proto` file(s) to generate the implementation of gRPC service(s) for you.

> **Note:**
>
> The latest version (v1.10 - default) of gripmock is requiring `go_package` declaration in the `.proto` file. This is due to the latest update of `protoc` plugin that is used by gripmock is making the `go_package` declaration mandatory.
>
> Version v1.11.1-beta release is available by overriding the `image.tag` in your `values.yaml` file. This version supports **NO** declaration of `go_package`.

## How to install this chart

A simple install with default values:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/gripmock
```

To install a specific version of this chart:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/gripmock --version <version>
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/gripmock
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/gripmock --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/gripmock -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| gripmock.mock | list | `["hello_service.proto"]` | A list of `.proto` files that will be mocked based on the stubs. |
| gripmock.proto.configmap | string | `"example-protos"` | The name of the configmap containing all your `.proto` files |
| gripmock.proto.path | string | `"/proto"` | The path where your configmap containing the proto files will be mounted |
| gripmock.stubs.configmap | string | `"example-stubs"` | The name of the configmap containing all the response definitions |
| gripmock.stubs.path | string | `"/stubs"` | The path where your stubs configmap will be mounted |
| hpa.enabled | bool | `false` |  |
| hpa.maxReplicas | int | `100` |  |
| hpa.minReplicas | int | `1` |  |
| hpa.targetCPUUtilizationPercentage | int | `80` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `"1.10.1"` | Overrides the image tag whose default is the chart appVersion. |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.hosts[0].paths[0].port | int | `4770` |  |
| ingress.hosts[0].paths[1].path | string | `"/"` |  |
| ingress.hosts[0].paths[1].pathType | string | `"ImplementationSpecific"` |  |
| ingress.hosts[0].paths[1].port | int | `4471` |  |
| ingress.tls | list | `[]` |  |
| labels | object | `{}` | Any extra label to apply to all resources |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` | Set the number of replicas in case hpa is not enabled |
| resources | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| MarceloAplanalp | <marcelo.aplanalp@deliveryhero.com> |  |

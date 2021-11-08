# prefer-node-descheduler

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A chart to install [Prefer-Node-Descheduler](https://github.com/deliveryhero/prefer-node-descheduler), a tool to
reschedule pods based on the `nodeAffinity` constraint `preferredDuringSchedulingIgnoredDuringExecution`.

This chart will setup everything required to run prefer-node-descheduler as a deployment in a Kubernetes cluster.

Further configuration can be passed as extra arguments.

**Homepage:** <https://github.com/deliveryhero/prefer-node-descheduler>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/prefer-node-descheduler
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/prefer-node-descheduler
```

To install with some set values:

```console
helm install my-release deliveryhero/prefer-node-descheduler --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/prefer-node-descheduler -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraLabels | object | `{}` | This section can be used to configure some extra labels that will be added to each Kubernetes object generated. |
| fullnameOverride | string | `""` | Override the fullname of the Chart. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` | The docker repository and image to be used. |
| image.tag | string | `""` | The image version to be used. |
| imagePullSecrets | list | `[]` | ImagePullSecrets to attach to the pods in order to download the image from a private registry. |
| nameOverride | string | `""` | Override the name of the Chart. |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | Extra annotations to add to the pods. |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas to run. |
| resources | object | `{}` | CPU/Memory requests and limits to set for the pod. |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mmingorance-dh | miguel.mingorance@deliveryhero.com |  |

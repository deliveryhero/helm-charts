# cloudhealth-collector

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square) ![AppVersion: 957](https://img.shields.io/badge/AppVersion-957-informational?style=flat-square)

Deploys a k8s pod to collect data and generate reports based or resources usages, costs and other possibilities. Please check more about it on: https://www.cloudhealthtech.com/solutions/containers

Chart based on its official k8s resources: https://s3.amazonaws.com/cloudhealth-public/containers/kubernetes-collector-pod-template.yaml

A Cloudhealth account is required.

To install the chart a valid api token should be generated from adding a new cluster: https://apps.cloudhealthtech.com/containers_clusters

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/cloudhealth-collector
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/cloudhealth-collector --version 0.1.7
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cloudhealth-collector
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cloudhealth-collector --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cloudhealth-collector -f values.yaml
```

## Source Code

* <https://s3.amazonaws.com/cloudhealth-public/containers/kubernetes-collector-pod-template.yaml>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| api_token | string | `"<change-me>"` |  |
| cluster_name | string | `"your-cluster-name"` |  |
| deploymentAnnotations | object | `{}` |  |
| existingSecret.secretName | string | `""` |  |
| existingSecret.tokenKey | string | `""` |  |
| extraEnv | list | `[]` |  |
| extraLabels | object | `{}` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cloudhealth/container-collector"` |  |
| image.tag | int | `957` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"1000m"` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/cloudhealth-collector](https://github.com/deliveryhero/helm-charts/tree/master/stable/cloudhealth-collector)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/cloudhealth-collector](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fcloudhealth-collector)

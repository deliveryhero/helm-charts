# field-exporter

![Version: 1.4.0](https://img.shields.io/badge/Version-1.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.4.0](https://img.shields.io/badge/AppVersion-v1.4.0-informational?style=flat-square)

A chart to install [field-exporter](https://github.com/deliveryhero/field-exporter). This controller is used to fill the gap in [k8s-config-connector](https://github.com/GoogleCloudPlatform/k8s-config-connector) for exporting value from Config Connector managed resources into Secrets and ConfigMaps. This version adds support for AWS Controllers for Kubernetes (ACK) for resources like `relationaldb`, `DynamoDB` and `ElastiCache`.

**Homepage:** <https://github.com/deliveryhero/field-exporter>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/field-exporter
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/field-exporter --version 1.4.0
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/field-exporter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/field-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/field-exporter -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/field-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cluster.dnsDomain | string | `"cluster.local"` |  |
| controllerManager.manager.args[0] | string | `"--leader-elect"` |  |
| controllerManager.manager.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| controllerManager.manager.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| controllerManager.manager.image.repository | string | `"ghcr.io/deliveryhero/field-exporter"` |  |
| controllerManager.manager.image.tag | string | `"v1.3.4"` |  |
| controllerManager.manager.resources.limits.cpu | string | `"500m"` |  |
| controllerManager.manager.resources.limits.memory | string | `"128Mi"` |  |
| controllerManager.manager.resources.requests.cpu | string | `"10m"` |  |
| controllerManager.manager.resources.requests.memory | string | `"128Mi"` |  |
| controllerManager.podLabels | object | `{}` |  |
| controllerManager.replicas | int | `1` |  |
| controllerManager.serviceAccount.annotations | object | `{}` |  |
| enableCertManager | bool | `false` |  |
| keepTLSSecret | bool | `false` |  |
| kubernetesClusterDomain | string | `"cluster.local"` |  |
| metricsService.ports[0].name | string | `"https"` |  |
| metricsService.ports[0].port | int | `8443` |  |
| metricsService.ports[0].protocol | string | `"TCP"` |  |
| metricsService.ports[0].targetPort | string | `"https"` |  |
| metricsService.type | string | `"ClusterIP"` |  |
| webhookService.ports[0].port | int | `443` |  |
| webhookService.ports[0].protocol | string | `"TCP"` |  |
| webhookService.ports[0].targetPort | int | `9443` |  |
| webhookService.type | string | `"ClusterIP"` |  |
| webhookTLS.caCert | string | `nil` |  |
| webhookTLS.cert | string | `nil` |  |
| webhookTLS.key | string | `nil` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| vzholudev |  | <https://github.com/vzholudev> |
| mtahaahmed |  | <https://github.com/mtahaahmed> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/field-exporter](https://github.com/deliveryhero/helm-charts/tree/master/stable/field-exporter)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/field-exporter](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Ffield-exporter)

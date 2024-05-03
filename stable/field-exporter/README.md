# field-exporter

![Version: 1.3.1](https://img.shields.io/badge/Version-1.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.3.1](https://img.shields.io/badge/AppVersion-v1.3.1-informational?style=flat-square)

A chart to install [field-exporter](https://github.com/deliveryhero/field-exporter). This controller is used to fill the gap in [k8s-config-connector](https://github.com/GoogleCloudPlatform/k8s-config-connector) for exporting value from Config Connector managed resources into Secrets and ConfigMaps.

**Homepage:** <https://github.com/deliveryhero/field-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/field-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/field-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/field-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/field-exporter -f values.yaml
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
| controllerManager.manager.image.repository | string | `"europe-docker.pkg.dev/dp-common-infra-5780/developer-platform-public/deliveryhero/field-exporter"` |  |
| controllerManager.manager.image.tag | string | `"v1.3.1"` |  |
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
| vzholudev | <no-reply@deliveryhero.com> | <https://github.com/vzholudev> |

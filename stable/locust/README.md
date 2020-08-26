# locust

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![AppVersion: 1.2.1](https://img.shields.io/badge/AppVersion-1.2.1-informational?style=flat-square)

A chart to install Locust, a scalable user load testing tool written in Python.

This chart will setup everything required to run a full distributed locust environment with any amount of workers.

This chart will also create configmaps for storing the locust files in Kubernetes, this way there is no need to build custom docker images.

**Homepage:** <https://github.com/locustio/locust>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
```

A simple install with default values:

```console
helm install deliveryhero/locust
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/locust
```

To install with some set values:

```console
helm install my-release deliveryhero/locust --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/locust -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| downscale.enabled | bool | `true` |  |
| downscale.hour | int | `19` |  |
| downscale.image | string | `"bitnami/kubectl:latest"` |  |
| downscale.minute | int | `0` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"locustio/locust"` |  |
| image.tag | string | `"1.2.1"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| loadtest.environment | object | `{}` |  |
| loadtest.locust_filename | string | `"main.py"` | the name of the locustfile |
| loadtest.locust_host | string | `"https://www.google.com"` | the host you will load test |
| loadtest.name | string | `"example"` | a name used for resources and settings in this load test |
| loadtest.pip_packages | list | `[]` | a list of extra python pip packages to install loadtest.environment -- environment variables used in the load test |
| master.resources | object | `{"limits":{"cpu":"2000m","memory":"1024Mi"},"requests":{"cpu":"1000m","memory":"1024Mi"}}` | resources for the locust master |
| nameOverride | string | `""` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.extraLabels | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| worker.hpa.enabled | bool | `false` |  |
| worker.hpa.maxReplicas | int | `100` |  |
| worker.hpa.minReplicas | int | `1` |  |
| worker.hpa.targetCPUUtilizationPercentage | int | `40` |  |
| worker.replicas | int | `1` |  |
| worker.resources | object | `{"limits":{"cpu":"500m","memory":"256Mi"},"requests":{"cpu":"500m","memory":"256Mi"}}` | resources for the locust worker |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

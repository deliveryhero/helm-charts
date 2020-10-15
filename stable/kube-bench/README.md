# kube-bench

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)

Helm chart to deplot run kube-bench as a cronjob on gke or eks.

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/kube-bench
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/kube-bench
```

To install with some set values:

```console
helm install my-release deliveryhero/kube-bench --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/kube-bench -f values.yaml
```

## Configuration

The following table lists the configurable parameters of the docker-registry chart and
their default values.

|          Parameter                   |                         Description                         |                   Default                    |
| :----------------------------------- | :---------------------------------------------------------- | :------------------------------------------- |
| `provider`                           | The cloud provider to deploy kube-bench either `eks` or `gke`   | `eks`                                        |
| `image.pullPolicy`                   | Container pull policy                                       | `IfNotPresent`                               |
| `image.repository`                   | Container image to use                                      | `aquasec/kube-bench`                         |
| `image.tag`                          | Container image tag to deploy                               | `0.1.0`                                      |
| `cronjob.schedule`                   | Schedule for the CronJob                                    | `0 0 1 * *`                                  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| goelankitt | no-reply@deliveryhero.com |  |

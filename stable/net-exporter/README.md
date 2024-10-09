# net-exporter

![Version: 1.10.4](https://img.shields.io/badge/Version-1.10.4-informational?style=flat-square) ![AppVersion: 1.10.3](https://img.shields.io/badge/AppVersion-1.10.3-informational?style=flat-square)

Helm chart for net-exporter.

**Homepage:** <https://github.com/giantswarm/net-exporter>

## How to install this chart

A simple install with default values:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/net-exporter
```

To install a specific version of this chart:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/net-exporter --version <version>
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/net-exporter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/net-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/net-exporter -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| NetExporter.DNSCheck.TCP.Disabled | bool | `false` |  |
| NetExporter.Hosts | string | `""` |  |
| NetExporter.NTPServers | string | `""` |  |
| additionalLabels | object | `{}` |  |
| controlPlaneSubnets | list | `[]` |  |
| daemonset.priorityClassName | string | `"system-node-critical"` |  |
| dns.label | string | `"coredns"` |  |
| dns.namespace | string | `"kube-system"` |  |
| dns.port | int | `1053` |  |
| dns.service | string | `"coredns"` |  |
| groupID | int | `1000` |  |
| image.name | string | `"giantswarm/net-exporter"` |  |
| image.registry | string | `"docker.io"` |  |
| image.tag | string | `"[[ .Version ]]"` |  |
| kubectl.image.name | string | `"giantswarm/docker-kubectl"` |  |
| kubectl.image.registry | string | `"docker.io"` |  |
| kubectl.image.tag | string | `"1.18.8"` |  |
| name | string | `"net-exporter"` |  |
| port | int | `8000` |  |
| selector.app | string | `"net-exporter"` |  |
| serviceType | string | `"managed"` |  |
| timeout | string | `"5s"` |  |
| userID | int | `1000` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| pciang |  | <https://github.com/pciang> |

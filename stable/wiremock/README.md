# wiremock

![Version: 1.2.0](https://img.shields.io/badge/Version-1.2.0-informational?style=flat-square) ![AppVersion: 2.26.0](https://img.shields.io/badge/AppVersion-2.26.0-informational?style=flat-square)

A service virtualization tool (some call it mock server) for testing purposes.

This is a templated deployment of [WireMock](http://wiremock.org/) for mocking services during test scenario execution
for load tests as well as for manual and automated QA purposes.

By default the chart will install WireMock with only a `/status` mapping for readiness probes.

One can utilize it's HTTP API as well as the file configuration documented in the
[Running as a Standalone Process](http://wiremock.org/docs/running-standalone/) described in the "Configuring via JSON
over HTTP" and "JSON file configuration" chapters.

The JSON file configuration is the recommended setup and the [stub mappings](http://wiremock.org/docs/stubbing/)
should be provided in `ConfigMap`s one per folder.

> :warning: both folders `mappings` and `__files` are optional but each folder requires it's own `ConfigMap`. The
`-mappings` and `-files` suffixes are obligate.

```console
kubectl create configmap my-service1-stubs-mappings --from-file=path/to/your/service1/mappings
kubectl create configmap my-service1-stubs-files --from-file=path/to/your/service1/__files

kubectl create configmap my-service2-stubs-mappings --from-file=path/to/your/service2/mappings
kubectl create configmap my-service2-stubs-files --from-file=path/to/your/service2/__files
```

Install the chart passing the `stubs` as a value omitting the suffixes as both `mappings` and `__files` folders are
handled transparently during initialization depending on their existence.

```console
helm install my-wiremock deliveryhero/wiremock \
  --set consumer=my-consumer
  --set "consumer.stubs.my-service1-stubs=/mnt/my-service1-stubs" \
  --set "consumer.stubs.my-service2-stubs=/mnt/my-service2-stubs"
```

WireMock's [admin API](http://wiremock.org/docs/api/) is not publicly exposed, but can be accessed using port forwarding.

```console
kubectl port-forward my-wiremock-123456789a-bcdef 8080
```

The HTTP API can then be accessed using `http://localhost:8080/__admin/docs/` where a swagger UI is availabe.

> :warning: this does not work out for multi instance setups as there is no synchronization of mappings created using
the HTTP API between multiple instances.

In case JSON files need to be provided, which are too large for usual `ConfigMap`s, one can define a binary config map
with a zip archive that contains the file in question.

```console
gzip large.json
kubectl create configmap my-binary-stub --from-file=large.json.gz
```

The resulting archive can be best installed in the wiremock using a `values.yaml` file.

```yaml
consumer:
  initContainer:
  - name: unzip-large-file
    image: busybox:latest
    command: ["sh", "-c", "cp /archive/large.json.gz /working/mappings; gunzip /working/mappings/large.json.gz"]
    volumeMounts:
    - mountPath: /working
      name: working
    - mountPath: /archive
      name: my-binary-stub
  initVolume:
  - name: my-binary-stub
    configMap:
      name: my-binary-stub
```

**Homepage:** <http://wiremock.org/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/wiremock
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/wiremock
```

To install with some set values:

```console
helm install my-release deliveryhero/wiremock --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/wiremock -f values.yaml
```

## Source Code

* <https://github.com/tomakehurst/wiremock>
* <https://github.com/rodolpheche/wiremock-docker>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| consumer.args | list | `[]` | custom WireMock startup arguments. |
| consumer.args_include_default | bool | `true` | whether WireMock arguments for performance test setup should be included |
| consumer.environment | object | `{}` |  |
| consumer.initContainer | list | `[]` | support for stubs with large files using binary container with zip archive. |
| consumer.initVolume | list | `[]` | custom extra volume for the initialization container providing the zip archive. |
| consumer.name | string | `"example"` | a name used for resources and settings in this WireMock |
| consumer.stubs | object | `{}` | `ConfigMap`s with WireMock stubs `mappings` and/or `__files` folders. |
| deploymentAnnotations | object | `{}` |  |
| serviceAnnotations | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| hpa.cputhreshold | int | `40` |  |
| hpa.enabled | bool | `true` |  |
| hpa.maxpods | int | `40` |  |
| hpa.minpods | int | `1` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.repository | string | `"rodolpheche/wiremock"` |  |
| image.tag | string | `"2.26.0"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.block_admin | bool | `true` | Whether to create an Ingress configuration snippet to block access to the admin API (recommended) |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` | whether to create an Ingress |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| init.image.repository | string | `"busybox"` | the docker repository and image to be used for the init container. |
| init.image.tag | string | `"latest"` | the docker image tag for the init container image |
| java.mms | string | `"256M"` |  |
| java.xms | string | `"2G"` |  |
| java.xmx | string | `"2G"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pdb.enabled | bool | `false` | Whether to create a PodDisruptionBudget |
| podAnnotations | object | `{}` |  |
| probes.liveness | bool | `true` |  |
| probes.readiness | bool | `true` |  |
| replicas | int | `1` |  |
| resources.limits.cpu | int | `2` |  |
| resources.limits.memory | string | `"3Gi"` |  |
| resources.requests.cpu | int | `1` |  |
| resources.requests.memory | string | `"3Gi"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| strategy.type | string | `"RollingUpdate"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mshero | no-reply@deliveryhero.com |  |

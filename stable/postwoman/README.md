# Helm chart for Postwoman

[Postwoman](https://postwoman.io/) A free, fast and beautiful API request builder.

## Installing the Chart

Add delivery hero public chart repo.

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
helm repo update
```

A simple install:

```console
helm install deliveryhero/postwoman
```

To install the chart with the release name `my-release`:

```console
helm install --name my-release deliveryhero/postwoman
```

To install with values:

```console
helm install --name my-release deliveryhero/postwoman --set ingress.enabled=true
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete --purge my-release
```

The command removes nearly all the Kubernetes components associated with the
chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the postwoman chart and its default values.

| Parameter                 | Description                                        | Default                | Required |
|:------------------------- |:-------------------------------------------------- |:---------------------- |:-------- |
|`replicaCount`             | Number of replicas                                 | `1`                    | `yes`    |
|`image.repostitory`        | Image repository                                   | `liyasthomas/postwoman`| `yes`    |
|`image.tag`                | Image tag                                          | `v1.9.7`               | `yes`    |
|`image.pullPolicy`         | Image pull policy                                  | `IfNotPresent`         |          |
|`service.type`             | Service Type                                       | `ClusterIP`            | `yes`    |
|`service.port`             | The port the service will be exposed on            | `80`                   | `yes`    |
|`service.containerPort`    | The targetPort the service will forward request on | `3000`                 | `yes`    |
|`ingress.enabled`          | Enables ingress object                             | `false`                |          |
|`ingress.annotations`      | Required ingress annotations                       | `{}`                   |          |
|`ingress.tls`              | TLS secres used by ingress                         | `[]`                   |          |
|`ingress.hosts`            | Name of host attached to ingress                   | `example.local`        |          |
|`resources.limits.cpu`     | Allowed CPU limits                                 | `100m`                 |          |
|`resources.limits.memory`  | Allowed Memory limits                              | `128Mi`                |          |
|`resources.requests.cpu`   | Allowed CPU requests                               | `100m`                 |          |
|`resources.requests.memory`| Allowed memory requests                            | `128Mi`                |          |
|`extra_labels`             | The custom labels if you need                      | `{}`                   |          |

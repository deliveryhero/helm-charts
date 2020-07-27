# Helm chart for Cachet status system

[Drone](http://readme.drone.io/) v1 is a Continuous Integration platform built on container technology with native Kubernetes support.

## TL;DR;

```console
helm install stable/drone
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release stable/drone
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete --purge my-release
```

The command removes nearly all the Kubernetes components associated with the
chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the drone charts and their default values.

| Parameter            | Description                            | Default                | Required |
|:-------------------- |:--------------------------------------- | :--------------------- |:-------- |
| `image.repostitory`  | Image repository                        | `cachethq/docker`      | `yes`    |
| `image.tag`          | Image tag                               | `latest`               | `yes`    |
| `image.pullPolicy`   | Image pull policy                       | `IfNotPresent`         |          |
| `service.type`       | Service Type                            | `ClusterIP`            |          |
| `service.port`       | The port the service will be exposed on | `80`                   | `yes`    |
| `ingress.enabled`    | Enables ingress object                  | `false`                | `no`     |
| `ingress.annotations | Required ingress annotations            | `{}`                   | `no`     |
| `ingress.tls`        | TLS secres used by ingress              | `[]`                   | `no`     |
| `host.name`          | Name of host attached to ingress        | `nil`                  | `no`     |
| `host.path`          | Path used to route to backed service    | `/`                    | `no`     |

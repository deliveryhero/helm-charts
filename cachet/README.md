# Helm chart for Cachet status system

[Cachet](https://cachethq.io/) is an open source status page system.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install stable/cachet
$ helm install --name my-release stable/cachet
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete --purge my-release
```

The command removes nearly all the Kubernetes components associated with the
chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the cachet chart and its default values.

| Parameter                 | Description                             | Default                | Required |
|:------------------------- |:--------------------------------------- | :--------------------- |:-------- |
|`image.repostitory`        | Image repository                        | `cachethq/docker`      | `yes`    |
|`image.tag`                | Image tag                               | `latest`               | `yes`    |
|`image.pullPolicy`         | Image pull policy                       | `IfNotPresent`         |          |
|`service.type`             | Service Type                            | `ClusterIP`            | `yes`    |
|`service.port`             | The port the service will be exposed on | `80`                   | `yes`    |
|`ingress.enabled`          | Enables ingress object                  | `false`                |          |
|`ingress.annotations`      | Required ingress annotations            | `{}`                   |          |
|`ingress.tls`              | TLS secres used by ingress              | `[]`                   |          |
|`host.name`                | Name of host attached to ingress        | `nil`                  |          |
|`host.path`                | Path used to route to backed service    | `/`                    |          |
|`resources.limits.cpu`     | Allowed CPU limits                      | `100m`                 |          |
|`resources.limits.memory`  | Allowed Memory limits                   | `128Mi`                |          |
|`resources.requests.cpu`   | Allowed CPU requests                    | `100m`                 |          |
|`resources.requests.memory`| Allowed memory requests                 | `128Mi`                |          |
|`database.create`          | Create database for cachet              | `false`                |          |
|`database.host`            | Database host                           | `nil`                  |          |
|`database.port`            | Database port                           | `5432`                 |          |
|`database.name`            | Database name                           | `cachet`               |          |
|`database.username`        | Database username                       | `cachet`               |          |
|``database.instance_id`    | Database instance Id                    | `nil`                  |          |
|`database.driver`          | Database driver                         | `pssql`                |          |
|`env.public`               | Public environment variables            | `{}`                   | `yes`    |
|`env.private`              | Private environment variables           | `{}`                   | `yes`    |

> Note: All private environment variables should be encrypted if they are versioned alongside your infrastructure. Refer to installation [documentation](https://docs.cachethq.io/docs/installing-cachet) for all the required configuration environment variables

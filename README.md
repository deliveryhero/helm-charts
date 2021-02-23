# Helm Charts @ Delivery Hero

[![Delivery Hero ❤️ Helm](img/banner.png)](#)

[Delivery Hero](https://www.deliveryhero.com/) are big fans of Kubernetes and use [Helm](https://helm.sh/) extensively. Here we have collected a few charts that are used across our organisation.

## TLDR

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
helm search repo deliveryhero
helm install my-release deliveryhero/<chart>
```

[![adding deliveryhero chart repo](img/add-repo.gif)](#)

## Chart list

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/deliveryhero)](https://artifacthub.io/packages/search?repo=deliveryhero)

- [aws-s3-proxy](stable/aws-s3-proxy)
- [aws-service-events-exporter](stable/aws-service-events-exporter)
- [aws-storage-class](stable/aws-storage-class)
- [backstage](stable/backstage)
- [cachet](stable/cachet)
- [cloudhealth-collector](stable/cloudhealth-collector)
- [cluster-overprovisioner](stable/cluster-overprovisioner)
- [datadog-controller](stable/datadog-controller)
- [hoppscotch](stable/hoppscotch)
- [k8s-cloudwatch-adapter](stable/k8s-cloudwatch-adapter)
- [k8s-event-logger](stable/k8s-event-logger)
- [k8s-resources](stable/k8s-resources)
- [kube-bench](stable/kube-bench)
- [kube-downscaler](stable/kube-downscaler)
- [labelsmanager-controller](stable/labelsmanager-controller)
- [locust](stable/locust)
- [newrelic-controller](stable/newrelic-controller)
- [node-problem-detector](stable/node-problem-detector)
- [pg-repack-scheduler](stable/pg-repack-scheduler)
- [postgres-controller](stable/postgres-controller)
- [priority-class](stable/priority-class)
- [prometheus-aws-costs-exporter](stable/prometheus-aws-costs-exporter)
- [prometheus-aws-health-exporter](stable/prometheus-aws-health-exporter)
- [prometheus-darksky-exporter](stable/prometheus-darksky-exporter)
- [prometheus-k8s-events-exporter](stable/prometheus-k8s-events-exporter)
- [prometheus-new-relic-app-exporter](stable/prometheus-new-relic-app-exporter)
- [prometheus-new-relic-exporter](stable/prometheus-new-relic-exporter)
- [prometheus-sentry-exporter](stable/prometheus-sentry-exporter)
- [prometheus-soti-mobicontrol-exporter](stable/prometheus-soti-mobicontrol-exporter)
- [prometheus-spot-termination-exporter](stable/prometheus-spot-termination-exporter)
- [prometheus-statsd-exporter](stable/prometheus-statsd-exporter)
- [rds-downscaler](stable/rds-downscaler)
- [service-account](stable/service-account)
- [toxiproxy](stable/toxiproxy)
- [weblate](stable/weblate)

## Contributing

Contributions are welcome ❤️

This repository has multiple Github Actions to ensure quality is high, these include:

- [chart-testing](https://github.com/helm/chart-testing): lint and install tests
- [markdown-lint](https://github.com/avto-dev/markdown-lint): lint all markdown files
- [helm-docs](https://github.com/norwoodj/helm-docs): check all chart `README.md` have all values documented
- [helm-conftest](https://github.com/instrumenta/helm-conftest): Ensures standard labels are present

All chart `README.md` files are generated from a template. This ensures all values are documented and that formatting is consistent. See [here](https://github.com/norwoodj/helm-docs#valuesyaml-metadata) about how the table of values is producted and how to add descriptions to your chart values. To generate chart `README.md` files from the [template](ci/README.md.gotmpl), run this:

```console
docker run --rm -v "$PWD:/helm-docs" jnorwood/helm-docs:v0.14.0 --template-file=../../ci/README.md.gotmpl
```

To run `chart-testing` locally:

```console
brew install chart-testing
pip3 install yamale
ct lint --charts stable/<your chart>
```

## License

Contents of this repository and any charts without a specific license are licensed under the Apache-2.0 License. Some charts may have their own respective license at `<chart>/LICENSE`. When adding a new chart to this repository and the chart is copied from another repository then include the license from the source if is not Apache-2.0 and include a link to the source under the `sources` section in `<chart>/Chart.yaml`.

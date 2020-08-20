# Helm Charts @ Delivery Hero

[![Delivery Hero ❤️ Helm](img/banner.png)](#)

[Delivery Hero](https://www.deliveryhero.com/) are big fans of Kubernetes and use [Helm](https://helm.sh/) extensively. Here we have collected a few charts that are used across our organisation.

## TLDR

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
helm search repo deliveryhero
helm install my-release deliveryhero/<chart>
```

[![adding deliveryhero chart repo](img/add-repo.gif)](#)

## Chart list

- [cachet](stable/cachet)
- [k8s-cloudwatch-adapter](stable/k8s-cloudwatch-adapter)
- [postwoman](stable/postwoman)
- [prometheus-spot-termination-exporter](stable/prometheus-spot-termination-exporter)

## Contributing

Contributions are welcome ❤️

This repository has multiple Github Actions to ensure quality is high, these include:

- [chart-testing](https://github.com/helm/chart-testing): lint and install tests
- [markdown-lint](https://github.com/avto-dev/markdown-lint): lint all markdown files
- [helm-docs](https://github.com/norwoodj/helm-docs): check all chart `README.md` have all values documented
- [helm-conftest](https://github.com/instrumenta/helm-conftest): Ensures standard labels are present

All chart `README.md` files are generated from a template. This ensures all values are documented and that formatting is consistent. See [here](https://github.com/norwoodj/helm-docs#valuesyaml-metadata) about how the table of values is producted and how to add descriptions to your chart values. To generate chart `README.md` files from the [template](ci/README.md.gotmpl), run this:

```console
docker run --rm -v "$PWD:/helm-docs" jnorwood/helm-docs:latest --template-file=../../ci/README.md.gotmpl
```

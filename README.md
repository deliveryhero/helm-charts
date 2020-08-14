# Helm chart repository @ Delivery Hero

Public [Helm](https://helm.sh/) repository for charts we use at [Delivery Hero](https://www.deliveryhero.com/).

## Adding the repository

You can add the repository using the name `deliveryhero` with a simple command.

```console
helm repo add deliveryhero https://charts.deliveryhero.com/public
```

Of course you may choose a different name here.

## Contributing

Contributions are welcome ❤️

This repository has multiple Github Actions to ensure quality is high, these include:

- [chart-testing](hhttps://github.com/helm/chart-testing): lint and install tests
- [markdown-lint](https://github.com/avto-dev/markdown-lint): lint all markdown files
- [helm-docs](https://github.com/norwoodj/helm-docs): check all chart `README.md` have all values documented

To ensure a chart `README.md` is templated correctly use docker:

```console
docker run --rm -v "$PWD:/helm-docs" jnorwood/helm-docs:latest --template-file=../../ci/README.md.gotmpl
```

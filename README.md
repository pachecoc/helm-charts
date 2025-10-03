> **This repository is currently under construction.**

# Helm Charts

Repository containing Helm charts designed for deployment in cloud, on-premises, development, and testing/lab environments.

## Usage Examples

### Install a chart
```bash
# Generic example (replace <chart-name> and <version>)
helm install <release-name> oci://ghcr.io/pachecoc/charts/<chart-name> --version <version>

# Example: install sqs-admin v0.1.0
helm install sqs-admin oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0
```

### Upgrade a release

```bash
helm upgrade sqs-admin oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.2.0 -f my-values.yaml
```

### Show default values

```bash
helm show values oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0 > values.yaml
```

### Render manifests without installing

```bash
helm template sqs-admin oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0
```

### Pull a chart locally

```bash
helm pull oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0
```

# Repository GitHub Page

Helm charts can be fetched from the following URL:
https://pachecoc.github.io/helm-charts/

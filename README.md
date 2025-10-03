> **This repository is currently under construction.**

# Helm Charts

Repository containing Helm charts designed for deployment in cloud, on-premises, development, and testing/lab environments.

```bash

# Installing a chart
# Example: Installing a chart (replace <chart-name> and <version> as needed)
helm install <release-name> oci://<registry>/<namespace>/<chart-name> --version <version>

helm pull oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0
helm install sqs-admin oci://ghcr.io/pachecoc/charts/sqs-admin --version 0.1.0

# Pulling a chart
helm pull
```

# Github Pages

Helm charts can be fetched from the following URL:
https://pachecoc.github.io/helm-charts/

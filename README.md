# 🧭 Pacheco Helm Charts

> **Note:** This repository is under active development. Additional charts will be added soon.

This repository provides a collection of Helm charts built for deployment across **cloud**, **on-premises**, and **development/testing** environments.

---

## 📦 Charts Available

| Chart                     | Description                            | Latest Version |
| ------------------------- | -------------------------------------- | -------------- |
| [`sqs-ui`](charts/sqs-ui) | A Helm chart for AWS SQS Management UI | `0.1.0`        |

---

## 🚀 Adding the Repository

To use these charts, add the repository hosted on **GitHub Pages**:

```bash
helm repo add pacheco https://pachecoc.github.io/helm-charts
helm repo update
```

Check available charts:

```bash
helm search repo pacheco
```

---

## 🧩 Installation and Usage

### Install a Chart

```bash
# Generic example
helm install <release-name> pacheco/<chart-name> --version <version>

# Example
helm install sqs-ui pacheco/sqs-ui --version 0.1.0
```

### Upgrade a Release

```bash
helm upgrade sqs-ui pacheco/sqs-ui --version 0.2.0 -f my-values.yaml
```

### View Default Values

```bash
helm show values pacheco/sqs-ui --version 0.1.0 > values.yaml
```

### Render Templates Without Installing

```bash
helm template sqs-ui pacheco/sqs-ui --version 0.1.0
```

---

## 🐳 OCI Registry (Alternative Option)

Charts are also available through **GitHub Container Registry (GHCR)**:

```bash
# Download the chart package
helm pull oci://ghcr.io/pachecoc/charts/sqs-ui --version 0.1.0

# Install directly from OCI
helm install sqs-ui oci://ghcr.io/pachecoc/charts/sqs-ui --version 0.1.0
```

> 💡 Tip: Both GitHub Pages and GHCR contain identical charts — choose whichever method fits your workflow.

---

## 🧾 Useful Links

- 📘 **Helm Repository:** <https://pachecoc.github.io/helm-charts/>
- 📦 **OCI Package (GHCR):** <https://github.com/users/pachecoc/packages/container/package/charts%2Fsqs-ui>
- 🧱 **Source Repository:** <https://github.com/pachecoc/helm-charts>

---

## 🧠 Developer Guide

### Manually Package and Publish Charts

```bash
./scripts/publish.sh
git add docs/
git commit -m "Publish charts"
git push
```

This script performs the following:
- Packages charts located under `charts/`
- Updates `docs/index.yaml`
- Creates Git tags and GitHub releases
- Publishes to GitHub Pages

---

## 🤝 Contributing

Contributions are encouraged!

- Submit PRs for improvements or bug fixes.
- Follow semantic versioning for chart updates (e.g., `0.1.1 → 0.2.0`).

---

## 🪪 License

[MIT License](LICENSE) © Gustavo Pacheco

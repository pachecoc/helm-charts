#!/usr/bin/env bash
set -euo pipefail

CHART_NAME="sqs-admin"
CHART_VERSION=$(yq -r .version ${CHART_NAME}/Chart.yaml)

# Login to GHCR
echo "${GITHUB_TOKEN}" | helm registry login ghcr.io \
  --username "${GITHUB_USER}" \
  --password-stdin

# Package chart
helm lint "${CHART_NAME}"
helm dependency update "${CHART_NAME}"
helm package "${CHART_NAME}"

# Push chart
PACKAGE_FILE="${CHART_NAME}-${CHART_VERSION}.tgz"
helm push "${PACKAGE_FILE}" oci://ghcr.io/${GITHUB_USER}/charts

echo "✅ Chart pushed to GHCR!"
echo "Add repo: helm repo add mycharts oci://ghcr.io/${GITHUB_USER}/charts"
echo "Install: helm install ${CHART_NAME} mycharts/${CHART_NAME} --version ${CHART_VERSION}"

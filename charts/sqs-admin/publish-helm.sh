#!/usr/bin/env bash
set -euo pipefail

# -----------------------------
# Load environment variables
# -----------------------------
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "Missing .env file with GITHUB_USER, GITHUB_TOKEN, GITHUB_ORG"
  exit 1
fi

# -----------------------------
# Config
# -----------------------------
CHART_DIR="charts/sqs-admin"
CHART_NAME=$(yq -r .name "${CHART_DIR}/Chart.yaml")
CHART_VERSION=$(yq -r .version "${CHART_DIR}/Chart.yaml")
OCI_REGISTRY="oci://ghcr.io/${GITHUB_ORG}/charts"

# -----------------------------
# Login to GHCR
# -----------------------------
echo "Logging into GHCR as ${GITHUB_USER}..."
echo "${GITHUB_TOKEN}" | helm registry login ghcr.io \
  --username "${GITHUB_USER}" --password-stdin

# -----------------------------
# Package Helm chart
# -----------------------------
echo "Packaging chart ${CHART_NAME} version ${CHART_VERSION}..."
helm lint "${CHART_DIR}"
helm dependency update "${CHART_DIR}" || true
helm package "${CHART_DIR}"

# -----------------------------
# Push chart
# -----------------------------
PACKAGE_FILE="${CHART_NAME}-${CHART_VERSION}.tgz"
echo "Pushing ${PACKAGE_FILE} to ${OCI_REGISTRY}..."
helm push "${PACKAGE_FILE}" "${OCI_REGISTRY}"

echo "Chart published successfully"
echo "To pull:    helm pull ${OCI_REGISTRY}/${CHART_NAME} --version ${CHART_VERSION}"
echo "To install: helm install ${CHART_NAME} ${OCI_REGISTRY}/${CHART_NAME} --version ${CHART_VERSION}"

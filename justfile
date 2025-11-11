login:
  #!/usr/bin/env bash
  token=$(gcloud auth print-access-token)
  helm registry login -u oauth2accesstoken --password "$token" https://europe-west3-docker.pkg.dev

template:
  helm template hopr-gnosis-bridge -f values-example.yaml .

lint:
	helm lint -f values-example.yaml .

docs:
  #npm install -g @bitnami/readme-generator-for-helm@2.7.2
  readme-generator --values ./values.yaml --readme README.md --schema "/tmp/schema.json"

package:
  #!/usr/bin/env bash
  set -euo pipefail
  version=$(yq '.version' Chart.yaml )
  helm package .

push:
  #!/usr/bin/env bash
  set -euo pipefail
  version=$(yq '.version' Chart.yaml )
  helm push gnosis-bridge-${version}.tgz  oci://europe-west3-docker.pkg.dev/hoprassociation/helm-charts
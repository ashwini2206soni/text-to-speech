#!/bin/sh

set -e

# move concourse parameters into files for terraform consumption
echo "${TF_PROVIDER_GCP_CREDENTIALS}" > credentials.json

echo "==> Init <=="
terraform init \
    -input=false \
    -no-color \
    -backend-config=backend.tfvars \
    ./terraform

echo "==> Plan <=="
terraform plan \
    -out=main.tfplan \
    -input=false \
    -no-color \
    ./terraform

echo "==> Apply <=="
terraform apply \
    -input=false \
    -no-color \
    main.tfplan
echo "==> Done <=="

#!/bin/sh

set -e

# move concourse parameters into files for terraform consumption
echo "${GCP_CREDENTIALS}" > credentials.json

echo "==> Init <=="
terraform init \
    -input=false \
    -no-color \
    ./terraform

echo "==> Plan <=="
terraform plan \
    -out=main.tfplan \
    -input=false \
    -var-file=terraform/default.tfvars \
    -no-color \
    ./terraform

echo "==> Apply <=="
terraform apply \
    -input=false \
    -no-color \
    main.tfplan
echo "==> Done <=="

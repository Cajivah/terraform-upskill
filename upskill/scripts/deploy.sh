#!/bin/bash
die() { echo "$*" 1>&2 ; exit 1; }

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
if [ "$1" != "prod" ] && [ "$1" != "dev" ] ; then
  die "Environment not recognized, valid environments are: prod, dev"
fi

environment=$1

cd ../envs || exit
echo "ENVIRONMENT: ${environment}"
echo "Deploying generics"
cd ./1_generics || exit
terraform workspace select "$1"
terraform apply -var-file="../../config/${environment}/common.tfvars" -var-file="../../config/${environment}/generics.tfvars"

echo "Deploying database"
cd ../2_db || exit
terraform workspace select "$1"
terraform apply -var-file="../../config/${environment}/common.tfvars"

echo "Deploying app"
cd ../3_app || exit
terraform workspace select "$1"
terraform apply -var-file="../../config/${environment}/common.tfvars" -var-file="../../config/${environment}/app.tfvars"

#!/bin/bash
die() { echo "$*" 1>&2 ; exit 1; }

if [ "$#" -ne 1 ] ; then
  die "1 argument required, $# provided"
elif [ "$1" != "prod" ] && [ "$1" != "dev" ] ; then
  die "Environment not recognized, valid environments are: prod, dev"
fi

environment=$1
echo "ENVIRONMENT: ${environment}"

cd ../envs || exit

echo "Destroying app"
cd ./3_app || exit
terraform workspace select "$1"
terraform destroy -var-file="../../config/${environment}/common.tfvars" -var-file="../../config/${environment}/app.tfvars"

echo "Destroying database"
cd ../2_db || exit
terraform workspace select "$1"
terraform destroy -var-file="../../config/${environment}/common.tfvars"

echo "Destroying generics"
cd ../1_generics || exit
terraform workspace select "$1"
terraform destroy -var-file="../../config/${environment}/common.tfvars" -var-file="../../config/${environment}/generics.tfvars"

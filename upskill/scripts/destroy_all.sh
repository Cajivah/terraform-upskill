#!/bin/bash

cd ./envs || exit

echo "Destroying app"
cd ./3_app && terraform destroy -var-file="../../config/prod.tfvars"

echo "Destroying database"
cd ../2_db && terraform destroy -var-file="../../config/prod.tfvars"

echo "Destroying generics"
cd ../1_generics && terraform destroy -var-file="../../config/prod.tfvars"

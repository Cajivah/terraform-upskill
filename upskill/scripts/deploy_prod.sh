#!/bin/bash

cd ../envs

echo "Deploying generics"
cd ./1_generics && terraform apply -var-file="../../config/prod.tfvars"

echo "Deploying database"
cd ../2_db && terraform apply -var-file="../../config/prod.tfvars"

echo "Deploying app"
cd ../3_app && terraform apply -var-file="../../config/prod.tfvars"



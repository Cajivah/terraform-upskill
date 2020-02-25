#!/bin/bash

cd ../envs

echo "Switching generics to prod"
cd ./1_generics && terraform workspace select prod

echo "Switching db to prod"
cd ../2_db && terraform workspace select prod

echo "Switching app to prod"
cd ../3_app && terraform workspace select prod

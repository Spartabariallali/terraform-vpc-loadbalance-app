#!/bin/bash

terraform apply -target=module.vpc -auto-approve
# terraform apply -target=module.vpc -auto-approve
# terraform apply -target=module.cloudgeeks-ec2-sg -auto-approve
# terraform apply -target=module.ec2-app-v1 -auto-approve


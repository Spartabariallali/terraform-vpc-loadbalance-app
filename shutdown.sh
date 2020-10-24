# terraform destroy -target null_resource.remote-exec
terraform destroy -target module.app-alb -auto-approve
terraform destroy -target=module.ec2-app-v1 -auto-approve
terraform destroy -target=module.bari-ec2-sg -auto-approve
terraform destroy -target=module.alb-target -auto-approve
terraform destroy -target=module.vpc -auto-approve







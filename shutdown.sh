terraform destroy -target null_resource.remote-exec
terraform destroy -target module.app-alb
terraform destroy -target=module.ec2-app-v1
terraform destroy -target=module.bari-ec2-sg
terraform destroy -target=module.alb-target
terraform destroy -target=module.vpc







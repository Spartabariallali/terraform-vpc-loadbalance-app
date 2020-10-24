module "ec2-app-v1" {
  source = "./modules/ec2"
  region = "eu-west-1"
  key-name = "bari-terraform-v2"
  ami-id = "ami-07a7c0d7b3c0b4c93"
  instance-type = "t2.micro"
  number-of-ec2-instances-required = "1"
  public-key-file-name = "${file("./modules/ec2/bari-terraform-v2.pub")}"

  instance-name-taq = "bari-vpn"
  associate-public-ip-address = "true"

  vpc-security-group-ids = "${module.bari-ec2-sg.ec2-sg-security-group}"
  # ec2-subnets-ids = ["${module.vpc.public-subnet-ids}"]

  #IN CASE OF LAUNCHING EC2 IN SPECIFIC SUBNETS OR PRIVATE SUBNETS, PLEASE UN-COMMENT BELOW"
  #ec2-subnets-ids = ["${module.cloudgeeks-vpc.private-subnet-ids}"]
  ec2-subnets-ids = ["subnet-0235e7916a3b6e6a6"]
  user-data = "${file("./modules/ec2/httpd.sh")}"


}
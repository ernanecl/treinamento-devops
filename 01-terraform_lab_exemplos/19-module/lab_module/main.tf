provider "aws" {
  region = "sa-east-1"
}

variable "private_ip" {
  type        = string
  description = "Private IP"
}

module "network_aws" {
  source = "./vpc"
  nome   = "module_terraform_vpc_ernane"
}

module "instance_aws" {
  source = "./ec2"
  nome   = "module_terraform_ec2_ernane"

  #  private_ip = module.vpc_create.private
}

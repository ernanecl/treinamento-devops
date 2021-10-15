resource "aws" {
  region = "sa-east-1"
}

variable "private_ip" {
  type = string
  description = "Private IP"
}

module "vpc_create" {
  source = "./network_aws"
  nome = "module_terraform_vpc_ernane"
}

module "instance_create"{
  source = "./resources_aws"
  nome = "module_terraform_ec2_ernane"
  
  private_ip = module.vpc_create.priva
}

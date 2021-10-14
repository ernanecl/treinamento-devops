resource "aws" {
  region = "sa-east-1"
}

module "vpc_subnet" {
  source = "./create_network
  nome = "VPC nome"
}

module "aws_instance"{
  source = "./create_network"
  nome = "EC2 nome"
}

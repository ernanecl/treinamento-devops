variable "nome" {
  type = string
  description = "nome vpc"
}

variable "cidr_block" {
    type = string
    description = "VPC Name"
}

variable "random_network_subnet" {
  type = string
  default = "Network subnet number"
}

variable "random_host_subnet" {
  type = string
  default = "Host subnet number"
}

variable "availability_zone" {
  type = list(string)
  default = ["a","b","c"]
}

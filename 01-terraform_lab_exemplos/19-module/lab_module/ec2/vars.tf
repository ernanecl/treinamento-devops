variable "nome" {
  type = string
  description = "nome da instancia "
}

variable instance_type {
  type = list(string)
  default = ["micro","medium","large"]
}

provider "aws" {
    region = "sa-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "key-dev-ernane-aws"                # key chave publica cadastrada na AWS

  tags = {
    "Name" = "Ansible and Terraform - Ernane"
  }
  # subnet_id     = aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  # private_ip = "10.16.0.101"
  # vpc_security_group_ids = ["${aws_security_group.allow_ssh1.id}"]

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    encrypted   = true
    kms_key_id  = "ad51fbbd-816c-4ee5-a1bd-c9218b648507"
  }
}
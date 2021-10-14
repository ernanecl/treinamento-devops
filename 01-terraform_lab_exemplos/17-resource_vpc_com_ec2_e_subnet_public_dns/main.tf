provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name                = "key-dev-ernane-aws" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  private_ip              = "192.168.10.30"
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]

  tags = {
    Name = "Maquina para testar VPC do terraform - ernane"
  }
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.example.id
}

# terraform refresh para mostrar o ssh

output "aws_instance_e_ssh" {
  value = [
    aws_instance.web.public_ip,
    "ssh -i id_rsa_itau_treinamento ubuntu@${aws_instance.web.public_dns}"
  ]
}
provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {  
  
  for_each = var.instance_type
  instance_type = "t2.${each.value}" 
  content {
    ami                     = data.aws_ami.ubuntu.id
    key_name                = "key-dev-ernane-aws" # key chave publica cadastrada na AWS 
    subnet_id               =  aws_subnet.my_subnet_1a.id # vincula a subnet direto e gera o IP automático
    private_ip              = "192.168.0.30"
    vpc_security_group_ids  = [
      "${aws_security_group.allow_ssh_terraform.id}",
    ]
  }

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    encrypted = true
    kms_key_id = "ad51fbbd-816c-4ee5-a1bd-c9218b648507"
    #delete_on_termination = true
  }
  
  tags = {
     Name = "${var.nome}-${each.value}"
  }
}

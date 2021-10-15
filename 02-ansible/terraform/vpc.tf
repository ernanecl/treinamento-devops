resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tf-ansible-ernane-vpc"
  }
}

resource "aws_subnet" "my_subnet_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/27"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tf-lab-ernane-subnet_c"
  }
}


#resource "aws_network_interface" "my_subnet_c" {
 # subnet_id   = aws_subnet.my_subnet.id
 # private_ips = ["10.0.1.5"] # IP definido para instancia
 # security_groups = ["${aws_security_group.allow_ssh1.id}"]

 # tags = {
  #  Name = "primary_network_interface_ernane_my_subnet_a"
  #}
#}

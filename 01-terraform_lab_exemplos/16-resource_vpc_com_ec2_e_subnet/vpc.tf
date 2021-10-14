resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tf-lab-ernane-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/27"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-lab-ernane-subnet-1a"
  }
}

resource "aws_subnet" "my_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.32/27"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "tf-lab-ernane-subnet_1b"
  }
}

resource "aws_subnet" "my_subnet_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.64/27"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tf-lab-ernane-subnet_c"
  }
}


resource "aws_network_interface" "my_subnet" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["10.0.2.5"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface_ernane_my_subnet_a"
  }
}


resource "aws_network_interface" "my_subnet_b" {
  subnet_id   = aws_subnet.my_subnet_b.id
  private_ips = ["10.0.2.36"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface_ernane_my_subnet_b"
  }
}

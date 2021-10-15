resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.1.0/23"

  tags = {
    Name = "tf-ansible-ernane-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.128/25"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "ansible-ernane-subnet"
  }
}
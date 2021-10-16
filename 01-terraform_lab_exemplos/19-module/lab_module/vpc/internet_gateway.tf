resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "aws_internet_gateway_terraform_ernane"
  }
}
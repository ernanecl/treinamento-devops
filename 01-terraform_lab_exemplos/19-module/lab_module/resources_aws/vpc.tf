resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.10.0/24"
  enable_dns_hostnames = true

  tags = {
    Name = "TerraformVPCErnane"
  }
}

resource "aws_subnet" "my_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.10.0/27"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-lab-ernane-subnet-1a"
  }
}

resource "aws_subnet" "my_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.10.32/27"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-lab-ernane-subnet-1b"
  }
}

resource "aws_subnet" "my_subnet_1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.10.64/27"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-lab-ernane-subnet-1c"
  }
}

resource "aws_network_interface" "my_subnet_1a" {
  subnet_id   = aws_subnet.my_subnet_1a.id
  private_ips = ["192.168.10.25"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface_ernane_my_subnet_a"
  }
}


resource "aws_network_interface" "my_subnet_1b" {
  subnet_id   = aws_subnet.my_subnet_1b.id
  private_ips = ["192.168.10.55"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface_ernane_my_subnet_b"
  

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "aws_internet_gateway_terraform_ernane"
  }
}

resource "aws_route_table" "rt_terraform" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gw.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "route_table_terraform_ernane"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.rt_terraform.id
}

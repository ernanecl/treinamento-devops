resource "aws_network_interface" "my_subnet_1a" {
  subnet_id   = aws_subnet.my_subnet_1a.id
  private_ips = ["192.168.0.25"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface_ernane_my_subnet_a"
  }
}

# resource "aws_network_interface" "my_subnet_1b" {
#   subnet_id   = aws_subnet.my_subnet_1b.id
#   private_ips = ["192.168.0.55"] # IP definido para instancia
#   security_groups = ["${aws_security_group.allow_ssh1.id}"]

#   tags = {
#     Name = "primary_network_interface_ernane_my_subnet_b"
#   }
# }
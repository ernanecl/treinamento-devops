resource "aws_subnet" "my_subnet" {
  count = 3 # create 3 subnets
  
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "${substr(var.cidr_block, 0, 7)}.${substr(var.random_subnet)}.${substr(var.cidr_block, 10)}/24" #"192.168.0.0/24" 
  availability_zone = "sa-east-1${substr(var.availability_zone)}"

  tags = {
    Name = "lab-ernane-subnet-${count.index}"
  }
}


resource "random_integer" "random_network_subnet" {
  min = 0
  max = 15
  # keepers = {
  #   "key" = "value"
  # Generate a new integer each time we switch to a new listener ARN
    # listener_arn = "${var.listener_arn}"
  # }
}

resource "random_integer" "random_host_subnet" {
  min = 1
  max = 254
}

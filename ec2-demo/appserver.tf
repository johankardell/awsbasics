resource "aws_network_interface" "appserver" {
  subnet_id       = aws_subnet.private.id
  private_ips     = ["172.16.1.5"]
  security_groups = [aws_security_group.appserver.id]

  tags = {
    Name = "appserver"
  }
}

resource "aws_instance" "appserver" {
  ami               = "ami-00ee4df451840fa9d"
  instance_type     = "t2.micro"
  availability_zone = "us-west-2a"
  key_name          = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.appserver.id
    device_index         = 0
  }

  tags = {
    Name = "appserver"
  }
}

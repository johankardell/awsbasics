resource "aws_network_interface" "jumpserver" {
  subnet_id       = aws_subnet.public.id
  private_ips     = ["172.16.0.5"]
  security_groups = [aws_security_group.jumpserver.id]

  tags = {
    Name = "jumpserver"
  }
}

resource "aws_eip" "jumpserver" {
  vpc                       = true
  network_interface         = aws_network_interface.jumpserver.id
  associate_with_private_ip = aws_network_interface.jumpserver.private_ip

  tags = {
    "Name" = "jumpserver"
  }
}

resource "aws_instance" "jumpserver" {
  ami               = "ami-00ee4df451840fa9d" # us-west-2
  instance_type     = "t2.micro"
  availability_zone = "us-west-2a"
  key_name          = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.jumpserver.id
    device_index         = 0
  }

  tags = {
    "Name" = "jumpserver"
  }
}

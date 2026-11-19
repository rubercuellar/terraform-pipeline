resource "aws_instance" "amazon_linux_2023" {
  ami           = "ami-0daaea3de6306348a"
  instance_type = "t3.medium"

  key_name = "aws-keypair"

  vpc_security_group_ids = [aws_security_group.amazon_linux_sg.id]

  tags = {
    Name = "amazon-linux-2023"
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
}


resource "aws_security_group" "amazon_linux_sg" {
  name = "amazon-linux-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
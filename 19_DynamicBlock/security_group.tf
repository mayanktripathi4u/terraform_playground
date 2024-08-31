resource "aws_security_group" "allow_tls" {
  name = "dev_sg"

  ingress  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["98.87.76.56/32"]
  }

  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["98.87.76.56/32"]
  }

  ingress  {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["98.87.76.56/32"]
  }

  ingress  {
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = ["98.87.76.56/32"]
  }

  ingress  {
    from_port = 5990
    to_port = 5990
    protocol = "tcp"
    cidr_blocks = ["98.87.76.56/32"]
  }

  egress {
    from_port = 9292
    to_port = 9292
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 7000
    to_port = 7000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 9000
    to_port = 9000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_security_group"
  }
}
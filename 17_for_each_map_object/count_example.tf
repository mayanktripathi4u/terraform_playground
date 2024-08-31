variable "subnet_cidr_blocks" {
  description = "CIDR block for the subnets"
  type = list(string)
  default = [ "10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19" ]
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  count = length(var.subnet_cidr_blocks)
  vpc_id = aws_vpc.main.id
  cidr_block = aws_vpc.main.id
  availability_zone = "us-east-1a"
}
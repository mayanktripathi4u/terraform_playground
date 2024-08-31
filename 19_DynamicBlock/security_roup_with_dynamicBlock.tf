variable "ingress_ports" {
  type = list(number)
  default = [ 443, 22, 8080, 9090, 5990 ]
}

variable "egress_ports" {
  type = list(number)
  default = [ 7000, 9000, 9292, 8000 ]
}

resource "aws_security_group" "allow_tls" {
  name = "dev_sg"
    dynamic "dyn_ingress" {
        for_each = var.ingress_ports
    content {
        from_port = dyn_ingress.value
        to_port = dyn_ingress.value
        protocol = "tcp"
        cidr_blocks = ["98.87.76.56/32"]
        }
    }   

    ### Another way
    # dynamic "dyn_ingress" {
    #     for_each = var.ingress_ports
    #     iterator = somename
    #   content {
    #     from_port = somename.value
    #     to_port = somename.value
    #     protocol = "tcp"
    #     cidr_blocks = ["98.87.76.56/32"]
    #   }
    # }

    dynamic "dyn_egress" {
        for_each = var.egress_ports
    content {
        from_port = dyn_egress.value
        to_port = dyn_egress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }   

    tags = {
    Name = "dev_security_group"
  }
}
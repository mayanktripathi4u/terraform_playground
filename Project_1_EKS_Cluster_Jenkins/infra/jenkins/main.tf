# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-jenkins-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zone.azs.name
  public_subnets =  var.public_subnet
  map_public_ip_on_launch = true

  enable_dns_hostnames = true

  tags = {
    Name = "jenkins-vpc"
    Terraform = "true"
    Environment = "dev"
  } 
  public_subnet_tags = {
    Name = "Jenkins-subnet"
  }
}


# Security Group (SGs)
module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name = "jenkins-sg"
  description = "security group for jenkins server"
  vpc_id = module.vpc.default_vpc_id

  ingress_with_cidr_blocks = [
    {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        description = "SSH"
        cidr_blocks = "0.0.0.0/0"
    },
    {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        description = "SSH"
        cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_cidr_blocks = [
    {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Name = "jenkins-sg"
  }
}

# EC2
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "Jenkins-Server"

  instance_type = var.instance_type 
  key_name = "jenkins-server-key"
  monitoring = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data = file("jenkins-install.sh")
  availability_zone = data.aws_availability_zone.azs.name[0]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-jenkins-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zone.azs.name
  public_subnets =  var.public_subnet

  enable_dns_hostnames = true

  tags = {
    Name = "jenkins-vpc"
    Terraform = "true"
    Environment = "dev"
  } 
}


# Security Group (SGs)


# EC2


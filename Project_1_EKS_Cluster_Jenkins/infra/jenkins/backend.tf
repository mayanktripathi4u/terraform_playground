terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-jenkins"
    key = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
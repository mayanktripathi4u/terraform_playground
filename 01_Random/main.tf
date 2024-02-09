# provider "aws" {
#   region = var.aws_region
# }

# data "aws_caller_identity" "current" {}

resource "random_pet" "random_resource" {
  prefix = "sample"
  length = 5
}

resource "random_pet" "name" {
    keepers = {
        # Updating this value causes Terraform to genrate a new name.
      "key" = "My Value"
    }
  prefix = "cloud"
  length = 2
}

resource "random_string" "random_str" {
  length = 5
  special = false
  upper = false
}
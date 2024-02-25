resource "random_pet" "myRandom_pet" {
  prefix = "random"
  length = 5
}

resource "random_string" "myRandom_str" {
  length  = 5
  special = false
  upper   = false
}

resource "null_resource" "null_resource_hello" {
  # Defines when the provisioner should be executed
  triggers = {
    # The provisioner is executed then the `id` of the EC2 instance changes
    # id = random_pet.myRandom_pet.id
    result = random_string.myRandom_str.result
  }
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}

output "display_text" {
  description = "Just a startup project in Terraform"
  value = random_pet.myRandom_pet.id
}

output "display_random_str" {
  description = "Random STring"
  value = random_string.myRandom_str.result
}
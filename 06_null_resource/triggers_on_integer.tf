resource "random_integer" "myRandom_int" {
  min = 1
  max = 100
}

resource "null_resource" "null_resource_integer" {
  # Defines when the provisioner should be executed
  triggers = {
    # The provisioner is executed then the `id` of the EC2 instance changes
    id = random_integer.myRandom_int.id
  }
  provisioner "local-exec" {
    command = "echo Hello World using integer"
  }
}

output "display_integer_text" {
  description = "This time using random integer to generate different id"
  value = random_integer.myRandom_int.id
}
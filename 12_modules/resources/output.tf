output "name" {
  description = "The random name"
  value = random_pet.name.id
}

output "random_str" {
  description = "The random resource"
  value = random_string.random_str.result
}

output "name" {
  description = "The random name"
  value = random_pet.name.id
}

output "random_res" {
  description = "The random resource"
  value = random_pet.random_resource.id
}

output "random_res_keeper" {
  description = "The random resource"
  value = random_pet.name.keepers
}

output "random_str" {
  description = "The random resource"
  value = random_string.random_str.result
}

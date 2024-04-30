output "root_module_res1_name" {
  value = module.res-1.name
  description = "Name from Module Resource - res_1 File"
}

output "root_module_res1_rstr" {
  value = module.res-1.random_str
  description = "Random Str from Module Resource - res_3 File"
}

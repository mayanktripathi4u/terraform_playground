output "count_loop_example_count" {
  description = "Example for Count loop."
  value       = length(var.user_names)
}

# output "count_loop_example_val" {
#   description = "Example for Count loop."
#   value       = one(var.user_names[count.index])
# }

# count = length(var.user_names)
# name  = var.user_names[count.index]


# output "for_each_loop_example" {
#   description = "Example for each loop."
#   value       = length(var.user_names)
# }

output "for_loop_example" {
  description = "Example for loop."
  value       = [for name in var.user_names : name]
}


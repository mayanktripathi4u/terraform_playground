variable "emp_age" {
  type = map(number)
  default = {
    "mayank" = 20,
    "raj" = 21,
    "matt" =22,
    "sanjay" = 23
  }
}

output "output_emp_age" {
  value = [for name, age in var.emp_age: "${name} age is ${age}"]
}


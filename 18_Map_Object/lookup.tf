variable "emp_salary" {
  type = map(string)
  default = {
    "mayank" = "20k",
    "raj" = "21k",
    "matt" ="22k",
    "sanjay" = "20k"
  }
}

variable "emp_name" {
  type = string
}

output "output_emp_sal" {
  value = "Employee Name : ${var.emp_name} and Salary is ${lookup(var.emp_salary, var.emp_name)}"
}

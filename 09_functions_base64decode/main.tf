variable "base64decode" {
  default = "MTIzNA=="
}

# Returns 1234
output "base64decode" {
  value = "${base64decode(var.base64decode)}"
}
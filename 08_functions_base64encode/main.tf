variable "base64encode" {
  default = "Nashville"
}

# Returns 1234
output "base64encode" {
  value = "${base64encode(var.base64encode)}"
}
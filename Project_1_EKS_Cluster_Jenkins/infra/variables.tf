variable "vpc_cidr" {
  description = "VPS CIDR"
  type = string
}

variable "public_subnet" {
  description = "Public Subnets"
  type = list(string)
}
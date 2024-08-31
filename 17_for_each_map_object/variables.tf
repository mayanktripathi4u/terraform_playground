variable "vpcs" {
  type = map(object({
    cidr=string
    tags=map(string)
    tenancy=string
  }))
  default = {
    "one" = {
      cidr = "10.0.0.0/16"
      tags={
        "Name"="vpc-one"
      }
      tenancy="default"
    }
    "two" = {
      cidr = "10.20.0.0/16"
      tags={
        "Name"="vpc-two"
      }
      tenancy="default"
    }
  }
}
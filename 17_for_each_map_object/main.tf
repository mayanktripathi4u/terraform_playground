resource "aws_vpc" "main_vpc" {
  for_each = var.vpcs
  cidr_block = each.value["cidr"]
  instance_tenancy = each.value["tenancy"]
  tags = each.value["tags"]
}
resource "random_string" "random_bucket_name" {
  length = 16
  special = false
}

output "output_random_bucket_name" {
  value = random_string.random_bucket_name.id # id and result are holding same value.
}


# terraform apply
# terraform apply --auto-approve


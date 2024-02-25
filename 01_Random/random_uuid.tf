resource "random_uuid" "random_unique_id" {

}

output "output_random_uuid" {
  value = random_uuid.random_unique_id.result # id and result are holding same value.
}

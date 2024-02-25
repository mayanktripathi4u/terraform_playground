resource "random_id" "rng" {
  keepers = {
    myValChng = "${timestamp()}"
  }     
  byte_length = 8
}


output "output_random_id_id" {
  value = random_id.rng.id
}

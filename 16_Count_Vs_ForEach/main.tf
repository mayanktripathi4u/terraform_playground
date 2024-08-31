# Example for Count
resource "google_storage_bucket" "bkt_count" {
  count = 3
  name = "bkt-gcp-dev-00${count.index}"
  location = var.location
}

# With Count we can easliy create but hard to manage it while destroying

# For Each
resource "google_storage_bucket" "bkt_foreach" {
  for_each = toset(["1", "2", "3", "4", "5"])
  name = "bkt-gcp-dev-00${each.key}"
  location = var.location
}
# Now with this if we want to destroy any we just remove the element.

# Another Example of for_each
 resource "google_storage_bucket" "bkt_name" {
   for_each = {
    "mykey1" = {name = "homelab", location = "us-central1"}
    "mykey2" = {name = "testlab", location = "eu"}
    "mykey3" = {name = "sandbox", location = "us-central1"}
   }
   name = each.value.name
   location = each.value.location
 }
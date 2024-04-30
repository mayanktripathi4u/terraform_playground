resource "random_pet" "name" {
    keepers = {
        # Updating this value causes Terraform to genrate a new name.
      "key" = "My Value"
    }
  prefix = "cloud"
  length = 2
}
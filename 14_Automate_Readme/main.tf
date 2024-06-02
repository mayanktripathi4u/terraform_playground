resource "google_storage_bucket" "my-bkt" {
  name = var.bucket_name
  location = var.location
  project = var.project
  force_destroy = true
  public_access_prevention = "enforced"
}

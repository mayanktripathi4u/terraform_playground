variable "bucket_name" {
  type = string
  description = "name of the Google Storage Bucket"
}

variable "location" {
  type = string
  description = "Location of the Google Storage Bucket"
  default = "US"
}

variable "project" {
  type = string
  description = "Project ID of the Google Storage Bucket"
  default = "my-project-1234"
}

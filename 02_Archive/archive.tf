data "archive_file" "single_file" {
  type = "zip"
  source_file = "my_test_file.csv"
  output_path = "zipFolder/myZipFile.zip"
}

output "output_path" {
  description = "Output Path of my Zip File"
  value = data.archive_file.single_file.output_path
}
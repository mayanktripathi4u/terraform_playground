locals {
  json_data = jsondecode(file("${path.module}/data.json"))
  tn_capital = upper(local.json_data.capitals.TN)
  new_value = lookup(local.json_data.capitals, "USA", "Washington D.C.")
  decoded_poa = base64decode(local.json_data.capitals.TN_E)
  encoded_poa = base64encode(local.json_data.capitals.TN)
  bbq_city = lookup(tomap(local.json_data.capitals), "TN", "NEW")
  bigger = max(10,20) > 10 ? "20 is bigger" : "10 is bigger"
  r_states = [for k,v in local.json_data.capitals: v if k == "TN" || k == "MP" ]
}

locals {
  json_data1 = jsondecode(file("${path.module}/data.json"))
}

output "module_path" {
#   value = path.module()
  value = "${path.module}/data.json"
}

output "file_function" {
  value = file("${path.module}/data.json")
}

output "jsondecode_function_output" {
  value = local.json_data1.capitals
}

output "json-data" {
  value = "${local.json_data}"
}

output "tn-capital" {
  value = "Capital : ${local.tn_capital} Encoded: ${local.encoded_poa}"
}

output "new-value" {
  value = "${local.new_value}"
}

output "all-capitals" {
  value = "${values(local.json_data.capitals)}"
}

output "bbq-city-is" {
  value = "City is : ${local.bbq_city} date/time is : ${timestamp()}"
}

output "password" {
  value = "Your password = secret = ${sha256("secret")}"
}

output "result-bigger" {
  value = "${local.bigger}"
}
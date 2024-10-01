If you want to use a YAML file to define IAM role bindings instead of defining them directly in a Terraform `map` of objects, you can achieve this by following these steps:

Define the YAML Structure: Define a YAML file that represents the role bindings.

Read the YAML File in Terraform: Use the `terraform-provider-yaml` or another method to read the YAML file and convert it into a format that Terraform can use.

Use the Read Data in Terraform Configuration: Convert the YAML data into Terraform variables and use it to create IAM role bindings.

# Example: Using YAML for Role Bindings
1. Define the YAML Structure
Create a YAML file (`role_bindings.yaml`) with the structure you want:
```yaml
# role_bindings.yaml

role_bindings:
  - project: "project-1"
    identity: "group:dev-reader@abc.eid.net"
    roles:
      - "roles/bigquery.jobs"
      - "roles/bigquery.jobUser"
      - "roles/bigquery.admin"
      - "roles/functionrunner"
  - project: "project-1"
    identity: "serviceAccount:sa-lower@iam.googleserviceaccount.com"
    roles:
      - "roles/iamsecurity.viewer"
      - "roles/bigquery.editor"
      - "roles/bigquery.admin"
      - "roles/editor"
  - project: "project-1"
    identity: "group:dev-writer@abc.eid.net"
    roles:
      - "roles/bigquery.editor"
      - "roles/viewer"
  - project: "project-2"
    identity: "group:dev-writer@abc.eid.net"
    roles:
      - "roles/bigquery.editor"
```

2. Read the YAML File in Terraform
To read the YAML file, you can use the `terraform-provider-yaml` provider. First, you need to add the `yaml` provider to your Terraform configuration.

Note: Ensure that you have the `terraform-provider-yaml` provider installed. If not, you may need to use a local script to parse the YAML and output JSON.

`main.tf`
```bash
terraform {
  required_providers {
    yaml = {
      source  = "local/yaml"
      version = "~> 0.1.0"
    }
  }
}

provider "yaml" {}

data "yaml_file" "role_bindings" {
  filename = "${path.module}/role_bindings.yaml"
}

variable "role_bindings" {
  description = "Role bindings read from YAML"
  type = list(object({
    project  = string
    identity = string
    roles    = list(string)
  }))
  default = data.yaml_file.role_bindings.role_bindings
}
```

3. Use the Data in Your Terraform Configuration
With the data loaded, you can create the IAM role bindings in your Terraform configuration. Note that `google_project_iam_binding` only supports one role per resource, so you'll need to handle each role separately.

`main.tf` (continued)
```bash
resource "google_project_iam_binding" "bindings" {
  for_each = {
    for binding in var.role_bindings : "${binding.project}-${binding.identity}-${binding.roles[0]}" => binding
  }

  project = each.value.project
  role    = each.value.roles[0]

  members = [
    each.value.identity
  ]

  count = length(each.value.roles)
}
```

# Summary
1. Define YAML File: Create a YAML file with your IAM role bindings configuration.
2. Read YAML Data: Use the terraform-provider-yaml provider or an alternative method to read the YAML file and convert it into Terraform variables.
3. Use Data: Use the variables in your Terraform configuration to create IAM role bindings.

**Alternative Approach Without** `terraform-provider-yaml`: If you prefer not to use the `terraform-provider-yaml`, you can convert the YAML to JSON using a script and then use the `jsondecode` function to parse the JSON in Terraform.

For example:

1. **Convert YAML to JSON**: Use a tool or script to convert the YAML file to a JSON file.

2. Use JSON in Terraform:
```bash
data "local_file" "role_bindings_json" {
  filename = "${path.module}/role_bindings.json"
}

locals {
  role_bindings = jsondecode(data.local_file.role_bindings_json.content)
}

variable "role_bindings" {
  description = "Role bindings read from JSON"
  type = list(object({
    project  = string
    identity = string
    roles    = list(string)
  }))
  default = local.role_bindings
}
```
This approach gives you flexibility in defining and managing your IAM role bindings using YAML or JSON, integrating seamlessly into your Terraform workflows.



# provider "google" {
#   project = "your-default-project-id"  # This can be overridden by the resource configuration
#   region  = "your-region"
# }

variable "projects_to_deploy" {
  description = "List of projects to deploy the alert policy"
  type        = list(string)
  default     = ["project-1", "project-2", "project-3", "project-4", "project-5"] # Projects where you want to deploy
}

variable "all_projects" {
  description = "List of all projects"
  type        = list(string)
  default     = ["project-1", "project-2", "project-3", "project-4", "project-5", "project-6", "project-7", "project-8"]
}

variable "project_id" {
  description = "Single Project"
  type        = string
  default     = "project-6"
}

# Create a null resource for testing
resource "null_resource" "test_count" {
  count = length([for p in var.projects_to_deploy : p if p == var.project_id])

  provisioner "local-exec" {
    command = "echo Project: ${element(var.projects_to_deploy, count.index)}"
  }
}

output "project_count" {
  value = null_resource.test_count.*.id
}

output "projects_deployed" {
  value = [for p in var.projects_to_deploy : p if p == var.project_id]
}

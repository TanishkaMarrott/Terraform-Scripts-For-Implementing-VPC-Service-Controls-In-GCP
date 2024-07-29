# Define the base directory
$baseDir = "C:\Users\tanis\Terraform-Scripts-For-Implementing-VPC-Service-Controls-In-GCP"

# Create the base directory
New-Item -ItemType Directory -Path $baseDir -Force

# Navigate to the base directory
Set-Location -Path $baseDir

# Create and add content to main.tf
$mainContent = @'
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_access_context_manager_access_policy" "access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = var.policy_name
}

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent      = google_access_context_manager_access_policy.access_policy.name
  name        = var.service_perimeter_name
  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    resources = var.resources
    restricted_services = var.restricted_services

    ingress_policies {
      ingress_from {
        sources {
          access_level = google_access_context_manager_access_level.access_level.name
        }
      }
      ingress_to {
        operations {
          service_name = "all"
        }
      }
    }

    egress_policies {
      egress_to {
        operations {
          service_name = "all"
        }
      }
    }
  }
}

resource "google_access_context_manager_access_level" "access_level" {
  parent = google_access_context_manager_access_policy.access_policy.name
  name   = var.access_level_name

  basic {
    conditions {
      ip_subnetworks = var.ip_subnetworks
    }
  }
}
'@
Set-Content -Path (Join-Path $baseDir "main.tf") -Value $mainContent

# Add, commit, and push main.tf
git add main.tf
git commit -m "Add main.tf with Terraform configuration for VPC Service Controls"
git push

# Create and add content to variables.tf
$variablesContent = @'
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region of the GCP project"
  type        = string
}

variable "organization_id" {
  description = "The ID of the GCP organization"
  type        = string
}

variable "policy_name" {
  description = "The name of the access policy"
  type        = string
}

variable "service_perimeter_name" {
  description = "The name of the service perimeter"
  type        = string
}

variable "resources" {
  description = "The resources to be included in the service perimeter"
  type        = list(string)
}

variable "restricted_services" {
  description = "The services to be restricted within the perimeter"
  type        = list(string)
}

variable "access_level_name" {
  description = "The name of the access level"
  type        = string
}

variable "ip_subnetworks" {
  description = "The IP subnetworks to be included in the access level"
  type        = list(string)
}
'@
Set-Content -Path (Join-Path $baseDir "variables.tf") -Value $variablesContent

# Add, commit, and push variables.tf
git add variables.tf
git commit -m "Add variables.tf with variable definitions for Terraform"
git push

# Create and add content to outputs.tf
$outputsContent = @'
output "access_policy_name" {
  value = google_access_context_manager_access_policy.access_policy.name
}

output "service_perimeter_name" {
  value = google_access_context_manager_service_perimeter.service_perimeter.name
}

output "access_level_name" {
  value = google_access_context_manager_access_level.access_level.name
}
'@
Set-Content -Path (Join-Path $baseDir "outputs.tf") -Value $outputsContent

# Add, commit, and push outputs.tf
git add outputs.tf
git commit -m "Add outputs.tf with output definitions for Terraform"
git push



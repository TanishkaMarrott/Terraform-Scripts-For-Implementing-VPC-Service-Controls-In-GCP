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

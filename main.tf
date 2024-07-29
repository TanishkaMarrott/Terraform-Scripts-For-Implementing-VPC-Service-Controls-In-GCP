provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_access_context_manager_access_policy" "access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = var.policy_name
}

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent         = google_access_context_manager_access_policy.access_policy.name
  name           = var.service_perimeter_name
  title          = var.service_perimeter_title
  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    resources          = ["projects/${var.trusted_project_1}", "projects/${var.trusted_project_2}"]
    restricted_services = ["storage.googleapis.com"]

    ingress_policies {
      ingress_from {
        sources {
          access_level = google_access_context_manager_access_level.access_level.name
        }
      }
      ingress_to {
        operations {
          service_name = "storage.googleapis.com"
        }
      }
    }

    egress_policies {
      egress_to {
        operations {
          service_name = "storage.googleapis.com"
        }
      }
    }
  }
}

resource "google_access_context_manager_access_level" "access_level" {
  parent = google_access_context_manager_access_policy.access_policy.name
  name   = var.access_level_name
  title  = var.access_level_title

  basic {
    conditions {
      ip_subnetworks = ["192.168.1.0/24", "10.0.0.0/16"]
      members        = ["user:example1@company.com", "user:example2@company.com"]
    }
  }
}

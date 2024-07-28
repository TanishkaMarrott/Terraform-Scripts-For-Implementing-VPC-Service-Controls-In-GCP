output "access_policy_name" {
  value = google_access_context_manager_access_policy.access_policy.name
}

output "service_perimeter_name" {
  value = google_access_context_manager_service_perimeter.service_perimeter.name
}

output "access_level_name" {
  value = google_access_context_manager_access_level.access_level.name
}

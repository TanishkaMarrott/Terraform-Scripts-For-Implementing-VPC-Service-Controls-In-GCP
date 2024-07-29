output "service_perimeter_name" {
  description = "The name of the created service perimeter"
  value       = google_access_context_manager_service_perimeter.service_perimeter.name
}

output "access_level_name" {
  description = "The name of the created access level"
  value       = google_access_context_manager_access_level.access_level.name
}

output "access_policy_name" {
  description = "The name of the created access policy"
  value       = google_access_context_manager_access_policy.access_policy.name
}

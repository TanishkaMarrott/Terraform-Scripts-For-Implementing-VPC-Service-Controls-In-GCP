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

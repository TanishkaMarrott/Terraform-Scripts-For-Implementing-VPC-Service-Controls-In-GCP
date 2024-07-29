variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
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

variable "access_level_name" {
  description = "The name of the access level"
  type        = string
}

variable "trusted_project_1" {
  description = "The ID of the first trusted project"
  type        = string
}

variable "trusted_project_2" {
  description = "The ID of the second trusted project"
  type        = string
}

variable "ip_subnetworks" {
  description = "List of IP subnets allowed"
  type        = list(string)
  default     = ["192.168.1.0/24", "10.0.0.0/16"]
}

variable "members" {
  description = "List of members allowed"
  type        = list(string)
  default     = ["user:example1@company.com", "user:example2@company.com"]
}

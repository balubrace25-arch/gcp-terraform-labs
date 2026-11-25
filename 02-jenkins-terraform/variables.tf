
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "t-isotope-431111-v4"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}
variable "jenkins_allowed_cidr" {
  description = "Public IP CIDR allowed to access Jenkins"
  type        = string
}
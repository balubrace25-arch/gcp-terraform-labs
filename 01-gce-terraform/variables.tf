
variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
  default     = "t-isotope-431111-v4"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP availability zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "Compute Engine VM name"
  type        = string
  default     = "terraform-gce-vm"
}

variable "machine_type" {
  description = "Compute Engine machine type"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Boot disk operating system image"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

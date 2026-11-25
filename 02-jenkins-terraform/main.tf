
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Get latest Ubuntu 24.04 LTS image
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2404-lts-amd64"
  project = "ubuntu-os-cloud"
}

# Jenkins VM
resource "google_compute_instance" "jenkins" {
  name         = "jenkins-practice1"
  machine_type = "n2-highmem-2"
  zone         = var.zone

  tags = ["jenkins-server", "allow-http", "allow-https"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      size  = 100
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }

  labels = {
    environment = "learning"
    managed_by  = "terraform"
    project     = "jenkins"
  }

  # Preserve SSH keys added outside Terraform
  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}

# Allow HTTP traffic
resource "google_compute_firewall" "allow_http" {
  name      = "jenkins-allow-http"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}

# Allow HTTPS traffic
resource "google_compute_firewall" "allow_https" {
  name      = "jenkins-allow-https"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-https"]
}

# Allow Jenkins access only from your public IP
resource "google_compute_firewall" "allow_jenkins" {
  name      = "jenkins-allow-8080"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["106.51.214.128/32"]
  target_tags   = ["jenkins-server"]
}

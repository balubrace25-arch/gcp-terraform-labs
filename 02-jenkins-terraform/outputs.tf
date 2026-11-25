
output "jenkins_vm_name" {
  value = google_compute_instance.jenkins.name
}

output "jenkins_public_ip" {
  value = google_compute_instance.jenkins.network_interface[0].access_config[0].nat_ip
}

output "jenkins_machine_type" {
  value = google_compute_instance.jenkins.machine_type
}

output "jenkins_zone" {
  value = google_compute_instance.jenkins.zone
}

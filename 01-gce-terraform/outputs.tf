
output "vm_name" {
  description = "Name of the created VM"
  value       = google_compute_instance.gce_vm.name
}

output "vm_zone" {
  description = "Zone where the VM is deployed"
  value       = google_compute_instance.gce_vm.zone
}

output "vm_machine_type" {
  description = "VM machine type"
  value       = google_compute_instance.gce_vm.machine_type
}

output "vm_internal_ip" {
  description = "Internal IP address of the VM"
  value       = google_compute_instance.gce_vm.network_interface[0].network_ip
}

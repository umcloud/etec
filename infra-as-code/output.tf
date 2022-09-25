output "vm_01_url_ip" {
  value = "http://${google_compute_instance.vm_01.network_interface.0.access_config.0.nat_ip}"
}
output "vm_01_url_name" {
  value = "http://${google_dns_record_set.etec.name}"
}

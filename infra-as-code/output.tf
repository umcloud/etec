output "vm_01_url_ip" {
  value = {
    url_ip   = "http://${google_compute_instance.vm_01.network_interface.0.access_config.0.nat_ip}",
    url_name = "http://${google_dns_record_set.etec.name}"
    ssh_cli = "ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ubuntu@${google_dns_record_set.etec.name}"
  }
}

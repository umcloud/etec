// Obtenter una referencia a la zona DNS
data "google_dns_managed_zone" "cloud_um_edu_ar" {
  name = "cloud-um-edu-ar"
}

// Crear la entrada DNS etec.cloud.um.edu.ar
resource "google_dns_record_set" "etec" {
  name         = "etec.${data.google_dns_managed_zone.cloud_um_edu_ar.dns_name}"
  managed_zone = data.google_dns_managed_zone.cloud_um_edu_ar.name
  type         = "A"
  ttl          = 120

  rrdatas = [google_compute_instance.vm_01.network_interface.0.access_config.0.nat_ip]
}


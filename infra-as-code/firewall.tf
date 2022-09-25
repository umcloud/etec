// Obtener una ref a la "default" VPC (network)
data "google_compute_network" "default" {
  name = "default"
}

// Crear una entrada de firewall para http (port 80), aplicarla
// a las VMs con tag="http"
resource "google_compute_firewall" "allow-http" {
  name    = "fw-allow-http"
  network = data.google_compute_network.default.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

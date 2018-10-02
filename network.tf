resource "google_compute_network" "vagrant_network" {
  name = "${var.network}"
}

resource "google_compute_subnetwork" "vagrant_network_subnetwork" {
  name          = "${var.network}-subnetwork-${var.subnetwork-region["belgium"]}"
  region        = "${var.subnetwork-region["belgium"]}"
  network       = "${google_compute_network.vagrant_network.self_link}"
  ip_cidr_range = "10.0.0.0/16"
}

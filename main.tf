resource "google_compute_disk" "actiniumiodisk" {
  name  = "${var.disk-name}"
  type  = "pd-ssd"
  zone  = "${var.region["belgium-b"]}"
  image = "${var.os["centos-7.5"]}"

  timeouts {
  create = "60m"
  }
}

resource "google_compute_image" "actiniumiobuild" {
  name = "${var.image-name}"
  family = "centos-7"
  source_disk = "${google_compute_disk.actiniumiodisk.self_link}"
  licenses = [
    "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx",
  ]
  timeouts {
  create = "60m"
  }
}

resource "google_compute_instance" "actiniumio-build-box" {
  count = "$var.vmcount"
  name = "${var.instance-name}-${cound.index}"
  machine_type = "${var.vm_type["7point5gig"]}"

  zone = "${var.region["belgium-b"]}"

  min_cpu_platform = "Intel Haswell"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
    "${var.network}-firewall-icmp",
    "${var.network}-firewall-openshift-console",
    "${var.network}-firewall-secure-forward",
  ]

  boot_disk {
    initialize_params {
      image = "${google_compute_image.actiniumiobuild.self_link}"
      size = "20"
    }
  }

  metadata {
    hostname = "${var.instance-name}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.vagrant_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }
  timeouts {
  create = "60m"
  }
}

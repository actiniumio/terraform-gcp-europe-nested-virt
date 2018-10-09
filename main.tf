resource "google_compute_disk" "vagrantdisk" {
  name  = "${var.disk-name}"
  type  = "pd-ssd"
  zone  = "${var.region["belgium-b"]}"
  image = "${var.os["centos-7.5"]}"

  timeouts {
  create = "60m"
  }
}

resource "google_compute_image" "vagrantbuild" {
  name = "vagrantbuild"
  family = "centos-7"
  source_disk = "https://www.googleapis.com/compute/v1/projects/${var.project-name}/zones/${var.region["belgium-b"]}/disks/${var.disk-name}"
  licenses = [
    "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx",
  ]
  timeouts {
  create = "60m"
  }
}

resource "google_compute_instance" "test" {
  name = "test"
  machine_type = "${var.vm_type["7point5gig"]}"

  zone = "${var.region["belgium-b"]}"

  min_cpu_platform = "Intel Haswell"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
    "${var.network}-firewall-icmp",
    "${var.network}-firewall-postgresql",
    "${var.network}-firewall-openshift-console",
    "${var.network}-firewall-secure-forward",
  ]

  boot_disk {
    initialize_params {
      image = "${google_compute_image.vagrantbuild.self_link}"
      size = "20"
    }
  }

  metadata {
    hostname = "test"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.vagrant_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }
  create_timeout = "60m"
}

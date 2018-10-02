provider "google" {
  credentials = "${file("${HOME}/account.json")}"
  project     = "${var.project-name}"
  region      = "${var.region["belgium-b"]}"
}

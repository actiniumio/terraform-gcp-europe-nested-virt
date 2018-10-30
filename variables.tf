variable "region" {
  default {
    "belgium-b" = "europe-west1-b"
    "belgium-c" = "europe-west1-c"
    "belgium-d" = "europe-west1-d"
    "london-a" = "europe-west2-a"
    "london-b" = "europe-west2-b"
    "london-c" = "europe-west2-c"
    "frankfurt-a" = "europe-west3-a"
    "frankfurt-b" = "europe-west3-b"
    "frankfurt-c" = "europe-west3-c"
    "netherlands-a" = "europe-west4-a"
    "netherlands-b" = "europe-west4-b"
    "netherlands-c" = "europe-west4-c"
    "finland-a" = "europe-north1-a"
    "finland-b" = "europe-north1-b"
    "finland-c" = "europe-north1-c"
 }
}

variable "project-name" {
}

variable "image-name" {
  default = "actiniumiobuild"
}

variable "disk-name" {
  default = "actiniumdisk"
}

variable "vmcount" {
}

variable "instance-name" {
  "default" = "actinium-build-box"
}

variable "subnetwork-region" {
  default {
    "belgium" = "europe-west1" # Belgium
    "london" = "europe-west2" # London
    "frankfurt" = "europe-west3" # Frankfurt
    "netherlands" = "europe-west4" # Netherlands
    "finland" = "europe-north1" # Finland
 }
}

variable "network" {
  default = "vagrant-network"
}

variable "vm_type" {
  default {
    "7point5gig" = "n1-standard-2"
  }
}

variable "os" {
  default {
    "centos-7.5"      = "centos-7-v20180815"
  }
}

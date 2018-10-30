[![CircleCI](https://circleci.com/gh/actiniumio/terraform-gcp-europe-nested-virt.svg?style=svg)](https://circleci.com/gh/actiniumio/terraform-gcp-europe-nested-virt)

# terraform on GCP europe

## Single node VM with nested virtualization activated

> The Devops Team use this terraform plan to provision GCP with circleci to build Vagrant Box under QEMU/KVM Hypervizor

This demonstrates the provisioning of a single compute VM(`7point5gig`) with a custom centos-7.5 based on the official image (these can be changed inside the `variables.tf` file) in GCP inside a custom created VPC with firewall rules attached to it.

```bash
$ terraform init
```

This will create the `terraform.tfstate` file

## Running it

```bash
$ terraform plan
$ terraform apply -var 'project-name=yourprojectname' -var 'vmcount=numberofvm'
```
> yourprojectname refers to your GCP project ID

> numberofvm is the number of VM you want to provision, for example here you will create 3 VM

## Appendix

### Supported Operating System

| Operating System            |
| --------------------------- |
| CentOS 7 - Release 7.5.1804 |

### Supported Region

You can found all the Google Cloud Plartform Region on this [Here](https://cloud.google.com/compute/docs/regions-zones/)


```bash
$ gcloud compute machine-types list | grep europe-west1
$ gcloud compute machine-types list | grep europe-west2
$ gcloud compute machine-types list | grep europe-west3
$ gcloud compute machine-types list | grep europe-west4
$ gcloud compute machine-types list | grep europe-north1
```

```bash
$ gcloud compute images list
```

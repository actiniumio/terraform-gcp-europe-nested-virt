# terraform on GCP europe

## Single node VM with nested virtualization activated

> The Devops Team use this terraform plan to provision GCP with circleci to build Vagrant Box

This demonstrates the provisioning of a single compute VM(`7point5gig`) with a custom centos-7.5 based on the official image (these can be changed inside the `variables.tf` file) in GCP inside a custom created VPC with firewall rules attached to it.

```bash
$ terraform init
```

This will create the `terraform.tfstate` file

**NOTE**

You can create multiple instances of the same type by modifying you `main.tf` like

```hcl
...
...
name = "${var.instance-name}"

## for a setup having multiple instances of the same type, you can do
## the following, there would be 2 instances of the same configuration
## provisioned
# count        = 2
# name         = "${var.instance-name}-${count.index}"
machine_type = "${var.vm_type["1point7gig"]}"

zone = "${var.region}"
...
...
```

## Running it

```bash
$ terraform plan
$ terraform apply -var 'yourprojectname'
```

## Appendix

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

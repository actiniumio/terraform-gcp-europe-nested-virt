[![CircleCI](https://circleci.com/gh/actiniumio/terraform-gcp-europe-nested-virt.svg?style=svg)](https://circleci.com/gh/actiniumio/terraform-gcp-europe-nested-virt)

# terraform on GCP europe on Nested Virtual Machine

## Init

> The Devops Team use this terraform plan to provision GCP with a CI/CD to test allspark.

This demonstrates the provisioning of a single compute VM(`2vCPU/7.5Go`) in GCP inside a custom created VPC with firewall rules attached to it.

```bash
$ terraform init
```

This will create the `terraform.tfstate` file

## Running it

```bash
$ terraform plan -var 'project-name=mykey' -var 'vmcount=mykey' -var 'region=mykey' -var 'instance-name=mykey' -var 'subnetwork-region=mykey' -var 'network=mykey' -var 'vm_type=mykey' -var 'os=mykey'
$ terraform apply -var 'project-name=mykey' -var 'vmcount=mykey' -var 'region=mykey' -var 'instance-name=mykey' -var 'subnetwork-region=mykey' -var 'network=mykey' -var 'vm_type=mykey' -var 'os=mykey'
```

## Variable

| Variable          | Value - Sample    | Description                                |
| ----------------- | ----------------- | ------------------------------------------ |
| project-name      | $GCP_PROJECT-Name | Name of your GCP project                   |
| vmcount           | 1                 | Number of VM that you want to provision    |
| region            | See Appendix      | Name of the GCP regions                    |
| instance-name     | AllSpark-foo-1    | Name given to your instance                |
| network           | allspark-network  | Name of your VPC                           |
| subnetwork-region | See Appendix      | Name of the subnetwork of your VPC         |
| vm_type           | See Appendix      | The size of the VM you want to provision   |
| os                | See Appendix      | The Operating System you want to provision |
| image-name        | actiniumimg       |                                            |
| disk-name         | actiniumdisk      |                                            |

## Appendix

### Supported Operating System

| Operating System            | GCP name           |
| --------------------------- | ------------------ |
| CentOS 7 - Release 7.5.1804 | centos-7-v20180815 |

```bash
$ gcloud compute images list
```

### Supported Region

You can found all the Google Cloud Plartform Region on this [Here](https://cloud.google.com/compute/docs/regions-zones/)

| Region      | GCP Subnetwork Region | GCP Zone  | GCP Region      |
| ----------- | --------------------- | --------- | --------------- |
| belgium     | europe-west1          | b / c / d | europe-west1-d  |
| london      | europe-west2          | a / b / c | europe-west2-a  |
| frankfurt   | europe-west3          | a / b / c | europe-west3-a  |
| netherlands | europe-west4          | a / b / c | europe-west4-a  |
| finland     | europe-north1         | a / b / c | europe-north1-a |

### Quotas and limits free asccount GCP

All Region : 24vCPU
Each Region: 8vCPU

### VM Type

| VM Type        | GCP Type      |
| -------------- | ------------- |
| 2vCPU / 7.5 Go | n1-standard-2 |

```bash
$ gcloud compute machine-types list | grep europe-west1
$ gcloud compute machine-types list | grep europe-west2
$ gcloud compute machine-types list | grep europe-west3
$ gcloud compute machine-types list | grep europe-west4
$ gcloud compute machine-types list | grep europe-north1
```

# Terraform AWS EKS Infrastructure

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonwebservices&logoColor=white" alt="AWS"/>
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" alt="Kubernetes"/>
</p>

## Overview

This repository contains Terraform configurations for deploying AWS infrastructure with Amazon EKS (Elastic Kubernetes Service). It was created as part of a learning series covering various Terraform concepts.

## Architecture

- **VPC** with public and private subnets across multiple availability zones
- **NAT Gateway** for outbound internet access from private subnets
- **EKS Cluster** with managed node groups
- **Kubernetes Add-ons**: CoreDNS, kube-proxy, VPC-CNI, EKS Pod Identity Agent

## Branch History

| Branch | Description |
|--------|-------------|
| `deploy-to-ec2-default-components` | Basic EC2 deployment with default configuration |
| `feature/provisioners` | Terraform provisioners examples |
| `feature/modules` | Modular Terraform structure |
| `feature/eks` | Full EKS cluster deployment |

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- [kubectl](https://kubernetes.io/docs/tasks/tools/) for cluster interaction

## Usage

1. Clone the repository
```bash
git clone <repository-url>
cd terraform-intro
```

2. Initialize Terraform
```bash
terraform init
```

3. Review the plan
```bash
terraform plan
```

4. Apply the configuration
```bash
terraform apply
```

5. Configure kubectl
```bash
aws eks update-kubeconfig --name myapp-eks-cluster --region ap-southeast-2
```

## Configuration

Edit `terraform.tfvars` to customize:

```hcl
vpc_cidr_block             = "10.0.0.0/16"
private_subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets_cidr_block  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
```

## Cleanup

```bash
terraform destroy
```

## License

MIT

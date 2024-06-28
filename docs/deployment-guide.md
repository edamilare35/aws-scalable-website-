# Deployment Guide

This guide explains how to deploy the infrastructure and website for the AWS Scalable Website project.

## Prerequisites

- An AWS account
- AWS CLI installed and configured
- SSH key pair for EC2 access
- Git installed

## Steps

### 1. Clone the Repository

```sh
git clone https://github.com/yourusername/aws-scalable-website.git
cd aws-scalable-website
```

### 2. Set Up Security Group

```sh
cd infrastructure
./security-group-setup.sh
```

### 3. Launch EC2 Instance

```sh
./ec2-instance-setup.sh
```

### 4. Set Up Load Balancer

```sh
./load-balancer-setup.sh
```

### 5. Deploy Website Files

```sh
scp -i your-key-pair.pem -r ../website/* ec2-user@your-ec2-public-dns:/var/www/html/
```

## Access the Website

Once the setup is complete, you can access the landing page via the load balancer's DNS name.
```
# EKS Deployment with Nginx Proxy and Let's Encrypt Certificates

This repository contains the necessary configuration and scripts to deploy applications on an Amazon EKS cluster with an Nginx reverse proxy and Let's Encrypt SSL certificates.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [Clone the Repository](#clone-the-repository)
  - [Configure Nginx](#configure-nginx)
  - [Create Secrets](#create-secrets)
- [Deploy](#deploy)
- [Accessing the Applications](#accessing-the-applications)


## Overview

This project sets up a Kubernetes environment on Amazon EKS, deploying multiple applications behind an Nginx proxy, secured with SSL certificates issued by Let's Encrypt.

## Prerequisites

Before you begin, ensure you have the following installed:

- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [AWS CLI](https://aws.amazon.com/cli/)

- An EKS cluster

## Setup

### Clone the Repository

Clone this repository to your local machine:

```sh
git clone https://github.com/rsr2004/k8s-eks.git
cd k8s-eks/deployments/
```

## Configure Nginx

Update the Nginx configuration to point to your SSL certificates. Ensure your certificates are located in /home/ec2-user/certs/ or update the path accordingly in the ConfigMap.
Create Secrets

Create Kubernetes secrets for your SSL certificates:

```
kubectl create secret tls rafael-tls --cert=/home/ec2-user/certs/fullchain1.pem --key=/home/ec2-user/certs/privkey1.pem
```

## Deploy

Deploy the Nginx proxy and your applications using the provided Kubernetes manifests:


```
kubectl apply -f nginx-configmap.yaml
kubectl apply -f nginx-deployment.yaml
```

Ensure your applications (e.g., plik-service, wiki-service, secret-service) are deployed and running in the default namespace.
Accessing the Applications

Your applications will be accessible via the following URLs (assuming your domain is rafaelsraposo.cloudns.be):

    http://plik.rafaelsraposo.cloudns.be (redirects to HTTPS)
    http://wiki.rafaelsraposo.cloudns.be (redirects to HTTPS)
    http://onetimesecret.rafaelsraposo.cloudns.be (redirects to HTTPS)
    https://cert.rafaelsraposo.cloudns.be/ejbca/adminweb

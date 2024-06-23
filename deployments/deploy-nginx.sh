#!/bin/bash

kubectl create secret generic rafael-tls \
  --from-file=fullchain.pem=/home/ec2-user/certs/fullchain1.pem \
  --from-file=privkey.pem=/home/ec2-user/certs/privkey1.pem \
  -n default

kubectl apply -f nginx-ingress-controller.yaml

# Wait for the NGINX deployment to be ready
kubectl rollout status deployment/nginx-proxy
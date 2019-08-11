#!/bin/bash

KUBERNETES_PUBLIC_IP=$(gcloud compute addresses describe k8s-stackx --region $(gcloud config get-value compute/region) --format 'value(address)')
sed -i -e "s/KUBERNETES_PUBLIC_IP/$KUBERNETES_PUBLIC_IP/g" inventory/group_vars/all

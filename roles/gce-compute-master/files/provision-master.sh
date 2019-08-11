#!/bin/bash
for i in 0 1 2; do
  gcloud compute instances create c1-master-${i} \
    --async \
    --boot-disk-size 200GB \
    --can-ip-forward \
    --image-family ubuntu-1604-lts \
    --image-project ubuntu-os-cloud \
    --machine-type n1-standard-2 \
    --private-network-ip 10.240.0.1${i} \
    --service-account k8s-provisioner@mstackx-248610.iam.gserviceaccount.com \
    --scopes "https://www.googleapis.com/auth/compute" \
    --subnet k8s-subnet \
    --tags k8s-stackx,master
done

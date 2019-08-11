#!/bin/bash

KUBERNETES_PUBLIC_IP=$(gcloud compute addresses describe k8s-stackx --region $(gcloud config get-value compute/region) --format 'value(address)')
gcloud compute http-health-checks create kubernetes --description "Kubernetes Health Check" --host "kubernetes.default.svc.cluster.local" --request-path "/healthz"
gcloud compute firewall-rules create k8s-stackx-allow-health-check --network k8s-stackx --source-ranges 209.85.152.0/22,209.85.204.0/22,35.191.0.0/16 --allow tcp
gcloud compute target-pools create kubernetes-target-pool --http-health-check kubernetes
gcloud compute target-pools add-instances kubernetes-target-pool --instances c1-master-0,c1-master-1,c1-master-2
gcloud compute forwarding-rules create kubernetes-forwarding-rule --address ${KUBERNETES_PUBLIC_IP} --ports 6443 --region $(gcloud config get-value compute/region) --target-pool kubernetes-target-pool


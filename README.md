# k8s-kubeadm-ha
#This repo is collection of ansible roles and playbook to install Kubernetes on GCP compute with help of Ansible

Prerequisites:-
~~~~~~~~~~~~~

1.> Download and install Google Cloud SDK. Configure it to access your google cloud account.
2.> Configure ansible.cfg in your working directory to replace it with your username.
3.> Create a service account in GCP cloud which have admin persmission on GCP compute resources.
4.> Replace SA name in roles gce-compute-master and gce-compute-worker which creates compute resources.



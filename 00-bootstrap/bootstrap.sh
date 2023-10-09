#!/bin/bash

oc adm groups new cluster-admins
oc adm groups add-user cluster-admins admin
oc adm policy add-cluster-role-to-group cluster-admin cluster-admins

echo "##### Installing Openshift-GitOps Operator #####"
oc create -k 00-openshift-gitops
sleep 90

echo "##### Creating ArgoCD Instance #####"
oc create -k 01-argocd
sleep 90

echo "##### Creating ArgoCD Project *Advanced-Cluster-Management* #####"
oc create -k 02-ACM-argo-deployment
sleep 30

echo "##### Integrating ArgoCD with RHACM #####"
oc create -k 03-ACM-argocd-integration

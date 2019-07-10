#! /usr/bin/env bash

DOMAIN_NAME=sumanmukherjeetech.com
SUBDOMAIN_NAME="k8s.$DOMAIN_NAME"
BUCKET_NAME="$(echo "$DOMAIN_NAME" | cut -d '.' -f1)-state-store"

# To create the route53 DNS entries
uuid=$(uuidgen) && aws route53 create-hosted-zone --name "$SUBDOMAIN_NAME" --caller-reference "$uuid" | jq ".DelegationSet.NameServers"
parent_zone_id="$(aws route53 list-hosted-zones | jq ".HostedZones[] | select(.Name==\"$DOMAIN_NAME.\") | .Id")"
aws route53 change-resource-record-sets --hosted-zone-id parent_zone_id --change-batch file://$(pwd)/subdomain_ns.json
dig ns "$SUBDOMAIN_NAME"

# To create S3 bucket with versioning for holding k8s state
aws s3api create-bucket --bucket "$BUCKET_NAME" --region us-east-1
aws s3api put-bucket-versioning --bucket "$BUCKET_NAME" --region us-east-1 --versioning-configuration Status=Enabled

# Install kops locally
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 $HOME/bin/kops

export NAME="c1.$SUBDOMAIN_NAME"
export KOPS_STATE_STORE="s3://$BUCKET_NAME"

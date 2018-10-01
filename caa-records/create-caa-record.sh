#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Please pass a hosted zone name as an argument"
    exit 0
fi

# Replace dots with dashes
DOMAIN_WITH_DASHES=`echo ${1} | tr . -`

aws cloudformation create-change-set \
    --region us-east-1 \
    --stack-name caa-record-${DOMAIN_WITH_DASHES} \
    --template-body file://caa-records.template.yaml \
    --change-set-type CREATE \
    --change-set-name create-stack \
    --parameters \
        ParameterKey=HostedZoneName,ParameterValue=${1}

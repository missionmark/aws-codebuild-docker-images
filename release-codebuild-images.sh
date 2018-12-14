#!/bin/bash
set -e

AWS_ACCOUNT_ID=980202454861
ECS_REGION=us-west-2
NAMESPACE="aws/codebuild"
ECR_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${ECS_REGION}.amazonaws.com"

# Login to ECR
aws ecr get-login --no-include-email | bash

docker build -t ${ECR_URI}/${NAMESPACE}/docker:18.09.0 ubuntu/docker/18.09.0
docker push ${ECR_URI}/${NAMESPACE}/docker:18.09.0

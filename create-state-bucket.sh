#!/bin/bash
bucketname='recipefinder-terraform-state'
region=`aws configure get region`

aws s3api create-bucket --acl private --bucket $bucketname --region $region --profile recipefinder --create-bucket-configuration LocationConstraint=$region
aws s3api put-bucket-versioning --bucket $bucketname --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucketname --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

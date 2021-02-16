#!/bin/bash
username='terraform-user'

aws iam create-user --user-name $username
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/CloudFrontFullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AWSLambdaFullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator
aws iam create-access-key --user-name $username
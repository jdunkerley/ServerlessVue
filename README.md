# ServerlessVue

- Front End Hosted in S3 bucket behind an CloudFront
- Lambdas for backend
- API Gateway granting access

## Initial Set Up

1. Create an new AWS IAM Role
```bash
#!/bin/bash
username='terraform-user'

aws iam create-user --user-name $username
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/CloudFrontFullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AWSLambdaFullAccess
aws iam attach-user-policy --user-name $username --policy-arn arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator
aws iam create-access-key --user-name $username
```
1. Set up the Access Key Id and Secret Access Key within GitHub Settings
- Within GitHub, go to Settings
- Within Settings, go to Secrets
- Use New Repository Secret
- Create as AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY

1. Create a S3 bucket to store terraform state:
```bash
#!/bin/bash
bucketname='recipefinder-terraform-state'
region=`aws configure get region`

aws s3api create-bucket --acl private --bucket $bucketname --region $region --profile recipefinder --create-bucket-configuration LocationConstraint=$region
aws s3api put-bucket-versioning --bucket $bucketname --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucketname --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

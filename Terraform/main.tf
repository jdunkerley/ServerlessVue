terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = var.bucket_name
    region = var.aws_region
    key = "branchname/tf.state"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}


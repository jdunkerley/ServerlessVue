terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "recipefinder-terraform-state"
    region = "eu-west-2"
    key    = "branchname/tf.state"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

data "git_repository" "current" {
  path = path.module
}

module "lambda" {
  for_each   = fileset(path.module, "../Lambdas/**/lambda_function.py")
  path       = abspath("${path.module}${each.key}")
  region     = var.aws_region
  account_id = data.aws_caller_identity.current.account_id
  source     = "./lambda"
}

terraform {
  required_version = ">= 0.12"

  # vars are not allowed in this block
  # see: https://github.com/hashicorp/terraform/issues/22088
  backend "s3" {
    access_key = "{{dggr_aws_key}}"
    secret_key = "{{dggr_aws_secret}}"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    archive = {
      source = "hashicorp/archive"
    }

    local = {
      source = "hashicorp/local"
    }
  }
}

# Provider used for creating the Lambda@Edge function which must be deployed
# to us-east-1 region (Should not be changed)
provider "aws" {
  region     = var.region
  access_key = var.aws_key
  secret_key = var.aws_secret
}




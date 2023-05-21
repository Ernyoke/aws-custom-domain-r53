terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "tf-demo-states-1234"
    key    = "aws-custom-domain-demo/api-gw"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}
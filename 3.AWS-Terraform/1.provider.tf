provider "aws" {}

terraform {
  required_version = "<= 1.6.6"
  required_providers {
    aws = {
      version = "<= 6.0.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "mittanadevops235"
    key            = "global/s3/mittanadevops235.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devsecopsb38-terraform-locks"
    encrypt        = true
  }
}


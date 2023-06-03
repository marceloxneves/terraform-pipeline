terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
  backend "s3" {
    bucket = "marceloxneves"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.location
  default_tags {
    #tags = {
    #  owner      = var.owner
    #  managed-by = "terraform"
    #}
    #ou
    tags = local.common_tags
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-remote-state-marceloxneves"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
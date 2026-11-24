terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "hrishiraj-p18-tfstate-590507089733"
    key          = "project-18/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

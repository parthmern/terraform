terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "remote-tf-infra-bucket"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "remote-dynamodb-table"
  }

}

provider "aws" {
  region = "us-east-2"
}
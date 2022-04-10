terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75"
    }
  }

  required_version = ">= 1.1"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}


resource "aws_key_pair" "demo" {
  key_name   = "demo-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

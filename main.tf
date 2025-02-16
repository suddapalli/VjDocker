terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }

  }
  backend "s3" {
    bucket         = "myvjbuck123"
    key            = "env/dev/terraform.tfstate"
    region = "us-east-1"
    acl = "bucket-owner-full-control"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"

  }

}

provider "aws" {
  region = var.zones

}

resource "aws_instance" "vjec2" {
  ami           = var.img
  instance_type = var.rtype

}
resource "aws_dynamodb_table" "vjdbtable1" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
    attribute {
    name = "LockID"
    type = "S"
  }
}

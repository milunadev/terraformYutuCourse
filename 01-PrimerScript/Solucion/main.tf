terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    }
}

provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "MiVM" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  tags = {
    Name = "AWS_Linux1"
  }
}
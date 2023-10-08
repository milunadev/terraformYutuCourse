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
  access_key = "AKIATBA7NU4HTK67SU6O"
  secret_key = "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"
}

resource "aws_instance" "MiVM" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  tags = {
    Name = "AWS_Linux1"
  }
}
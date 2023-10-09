terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    }
}

variable "region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.region
}

locals {
  vmami = var.ubuntu_version == 18 ? "" : ""
  vmname = "VM${var.env}_Ubuntu${var.ubuntu_version}"
}

resource "aws_instance" "MiVM" {
  ami = local.vmami
  instance_type = "t2.micro"
  tags = {
    Name = local.vmname
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.my_region
}

locals {
  instance_name = "VM_${var.env}_Ubuntu${var.ubuntu_v}"
  instance_ami = var.ubuntu_v == 22 ? "ami-03f65b8614a860c29" : "ami-0430580de6244e02e"
}

resource "aws_instance" "MiVm" {
  ami = local.instance_ami
  instance_type = var.myinstance_type
  tags = {
    Name = local.instance_name
  }
}


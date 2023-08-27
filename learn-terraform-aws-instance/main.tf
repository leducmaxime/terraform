terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-05b5a865c3579bbc4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-012852f2323dcafb9"]
  subnet_id              = "subnet-0dc56f911d96805e9"

  tags = {
    Name = var.instance_name
  }
}


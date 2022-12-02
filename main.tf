terraform {

  cloud {
    organization = "jah"
    workspaces {
      name = "learn-terraform-aws-instance"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
}

resource "aws_instance" "app_server" {
  ami           = "ami-00463ddd1036a8eb6"
  instance_type = "t2.micro"

  tags = {
    Name = "Jah1c"
  }
}

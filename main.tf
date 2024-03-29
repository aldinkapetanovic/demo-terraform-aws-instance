terraform {

  cloud {
    organization = "jah"
    workspaces {
      name = "demo-terraform-aws-instance"
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
  ami           = "ami-074543d9faf9c0509"
  instance_type = "t2.micro"

  tags = {
    Name = "MyDemoInstance"
  }
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

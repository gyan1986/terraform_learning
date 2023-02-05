provider "aws" { }

variable "subnet_cidr_block" {
  description = "subnet cidr block"  
}

resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {      
        Name: "development" 
        vpc_env: "dev" 
    }
  }
  

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
  tags = {
    Name: "dev-1-subnet"
  }
}


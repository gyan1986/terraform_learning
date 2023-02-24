provider "aws" {
  access_key = "${secrets.AWS_ACCESS_KEY_ID}"
  secret_key = "${secrets.AWS_SECRET_ACCESS_KEY}"
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
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name: "development"
  }
}


data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  availability_zone = "ap-south-1a"
   tags = {
    Name: "dev-subnet-2"
  }
}


output "dev-vpc" {
  value = aws_vpc.development-vpc.id
}

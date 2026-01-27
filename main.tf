provider "aws" {
  region = "ap-southeast-2"
}

# variable "subnet_cidr_block" {
#   description = "subnet cidr block"
#   default = "10.0.10.0/24"
#   type = string
# }

variable "cidr_blocks" {
  description = "cidr blocks and names tags for vpc and subnets"
  # type = list(string)
  type = list(object({
    cidr_block = string
    name = string
  }))
}

# variable "vpc_cidr_block" {
#   description = "vpc cidr block"
# }
#
# variable "environment" {
#   description = "deployment environment"
# }

resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    # Name: "development"
    Name: var.cidr_blocks[0].name
  }
}


resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = "ap-southeast-2a"
  tags = {
    # Name: "subnet-1-dev"
    Name: var.cidr_blocks[1].name
  }
}

# data "aws_vpc" "existing_vpc" {
#   default = true
# }
#
# resource "aws_subnet" "dev-subnet-2" {
#   vpc_id = data.aws_vpc.existing_vpc.id
#   cidr_block = "172.31.48.0/20"
#   availability_zone = "ap-southeast-2a"
#   tags = {
#     Name: "subnet-2-default"
#   }
# }
#
# output "dev-vpc-id" {
#   value = aws_vpc.development-vpc.id
# }
#
# output "dev-subnet-id" {
#   value = aws_subnet.dev-subnet-1.id
# }


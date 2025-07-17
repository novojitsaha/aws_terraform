resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "main-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

# Private EC2 Subnet 1
resource "aws_subnet" "private_ec2_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_ec2_subnet_1_cidr
  availability_zone = var.az1
  tags = {
    Name = "private-ec2-subnet-1"
  }
}

# Private EC2 Subnet 2
resource "aws_subnet" "private_ec2_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_ec2_subnet_2_cidr
  availability_zone = var.az2
  tags = {
    Name = "private-ec2-subnet-2"
  }
}

# Private RDS Subnet 1
resource "aws_subnet" "private_rds_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_rds_subnet_1_cidr
  availability_zone = var.az1
  tags = {
    Name = "private-rds-subnet-1"
  }
}

# Private RDS Subnet 2
resource "aws_subnet" "private_rds_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_rds_subnet_2_cidr
  availability_zone = var.az2
  tags = {
    Name = "private-rds-subnet-2"
  }
}

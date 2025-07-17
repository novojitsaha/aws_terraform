# Elastic IP for NAT Gateway in AZ1
resource "aws_eip" "nat_1" {
  domain = "vpc"
  tags = {
    Name = "nat-eip-az1"
  }
}

# NAT Gateway in Public Subnet 1 (AZ1)
resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.nat_1.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "nat-gw-az1"
  }
}

# Elastic IP for NAT Gateway in AZ2
resource "aws_eip" "nat_2" {
  domain = "vpc"
  tags = {
    Name = "nat-eip-az2"
  }
}

# NAT Gateway in Public Subnet 2 (AZ2)
resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.nat_2.id
  subnet_id     = aws_subnet.public_2.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "nat-gw-az2"
  }
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# PUBLIC SUBNET 1 TO IGW
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# PUBLIC SUBNET 2 TO IGW
resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}


# PRIVATE ROUTE TABLE - AZ1
resource "aws_route_table" "private_ec2_1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-ec2-rt-az1"
  }
}

# Route to NAT Gateway in AZ1
resource "aws_route" "private_ec2_1_nat" {
  route_table_id         = aws_route_table.private_ec2_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_1.id
}

# Associate with Private EC2 Subnet 1
resource "aws_route_table_association" "private_ec2_1" {
  subnet_id      = aws_subnet.private_ec2_1.id
  route_table_id = aws_route_table.private_ec2_1.id
}

# PRIVATE ROUTE TABLE - AZ2
resource "aws_route_table" "private_ec2_2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-ec2-rt-az2"
  }
}

# Route to NAT Gateway in AZ2
resource "aws_route" "private_ec2_2_nat" {
  route_table_id         = aws_route_table.private_ec2_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_2.id
}

# Associate with Private EC2 Subnet 2
resource "aws_route_table_association" "private_ec2_2" {
  subnet_id      = aws_subnet.private_ec2_2.id
  route_table_id = aws_route_table.private_ec2_2.id
}

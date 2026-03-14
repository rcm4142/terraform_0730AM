# Creating Nat Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  depends_on = [aws_internet_gateway.prod]

  tags = {
    Name = "NAT Gateway EIP"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.prod-subnet-1.id
  depends_on    = [aws_internet_gateway.prod]
}

# Add routes for VPC
resource "aws_route_table" "dev-private" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "production-private-1"
  }
}

# Creating route associations for private Subnets
resource "aws_route_table_association" "production-private-1" {
  subnet_id      = aws_subnet.prod-subnet-2.id
  route_table_id = aws_route_table.dev-private.id
}

#resource "aws_route_table_association" "production-private-2" {
  #subnet_id      = aws_subnet.prod-subnet-2.id
  #route_table_id = aws_route_table.dev-private.id
#}

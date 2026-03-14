# Creation of VPC, Subnet, Internet Gateway, Route Table, and Security Group

resource "aws_vpc" "prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "prod-vpc"
    
    }
}


#create nat gateway  (your task)
#public subnet
resource "aws_subnet" "prod-subnet-1" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "prod-subnet-1"
    }
}

#nat associate to private subnet (your task)
#private subnet
resource "aws_subnet" "prod-subnet-2" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "prod-subnet-2"
    }
}

resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
        Name = "prod-internet-gateway"
    }
}
#create route table and associate with public subnet
resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prod.id

    }
}

#create route table association with private subnet (your task)

resource "aws_route_table_association" "prod" {
    subnet_id = aws_subnet.prod-subnet-1.id
    route_table_id = aws_route_table.prod.id
}


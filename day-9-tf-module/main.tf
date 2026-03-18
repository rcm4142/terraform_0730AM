resource "aws_security_group" "prod" {
    name = "prod-sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_vpc.prod.id
    
    #inbound rule to allow SSH traffic
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #outbound rule to allow all traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "prod-public-instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.prod-subnet-1.id
    key_name = "testkey"
    vpc_security_group_ids = [aws_security_group.prod.id]
    associate_public_ip_address = true
    tags = {
        Name = "prod-public-instance"
    }
    
}

resource "aws_instance" "prod-private-instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.prod-subnet-2.id
    key_name = "testkey"
    vpc_security_group_ids = [aws_security_group.prod.id]
    associate_public_ip_address = false
    tags = {
        Name = "prod-private-instance"
    }
    
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"
  subnet_id     = "subnet-000f227274e9297c5"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
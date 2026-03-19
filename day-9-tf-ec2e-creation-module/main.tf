module "ec2_instance" {
  source = "../terraform-instance-template"

    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.medium"
    subnet_id = "subnet-0c9b1e5f8a1b2c3d"
    security_group_ids = ["sg-0123456789abcdef0"]           
}
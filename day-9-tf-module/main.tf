module "dev" {
  source = "../terraform-instance-template"
  ami_id = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.medium"
}
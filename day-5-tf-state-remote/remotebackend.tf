terraform {
  backend "s3" {
    bucket = "terraform-backend-practice-bucket-12032026"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

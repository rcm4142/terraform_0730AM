terraform {
  backend "s3" {
    bucket = "terraform-backend-practice-bucket-13032026"
    key    = "day-6/terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_instance" "name" {
    ami = "ami-0cb5cf49019e79c51"
    instance_type = "t2.medium"
    tags = {
        Name = "test-tf-import"
    }   
  
}
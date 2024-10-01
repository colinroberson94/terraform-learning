provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-08d8ac128e0a1b91c"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-example"
  }
}
terraform {
    backend "s3" {
    bucket = "colins-terraform-testing-remote-state"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-west-2"

    dynamodb_table = "terraform-learning-locks"
    encrypt        = true
  }
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-learning"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t4g.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  username = var.db_username
  password = var.db_password
}
terraform {
  backend "s3" {
    bucket = "colins-terraform-testing-remote-state"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "us-west-2"

    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}
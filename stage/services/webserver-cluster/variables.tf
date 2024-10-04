variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# this will allow us to access the state file of the database.
# Because all outputs are stored in the state file, we can then
# use this to read the database address and port.
data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = "colins-terraform-testing-remote-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-west-2"
  }
}
module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "colins-terraform-testing-remote-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  # override default values
  instance_type = "t3.nano"
  min_size      = 1
  max_size      = 3
}

# additional rules can be added to the ALB SG
resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
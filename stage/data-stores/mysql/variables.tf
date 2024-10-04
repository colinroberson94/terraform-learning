# one option here would be to set the environment variable as
# ``export TF_VAR_db_username="example"``
variable "db_username" {
  description = "Database username"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "Database password"
  type = string
  sensitive = true
}
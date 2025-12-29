variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "more_user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["kitts", "libby", "mija", "belle"]
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}

variable "give_neo_cloudwatch_full_access" {
  description = "If True, neo gets full access to CloudWatch"
  type        = bool
}
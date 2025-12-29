output "first_arn" {
  value       = aws_iam_user.example[0].arn
  description = "The ARN for the first user"
}

output "all_arns" {
  value       = aws_iam_user.example[*].arn
  description = "The ARN for all users"
}

output "upper_names" {
  value = [for name in var.names : upper(name)]
}

output "filtered_upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
  value = { for name, role in var.hero_thousand_faces : upper(name) => upper(role) }
}

# the following outputs a map where the keys are the keys in for_each (usernames) and values are all outputs for that resource
output "all_new_users" {
  value = aws_iam_user.another_example
}
# all_new_users = {
#   "belle" = {
#     "arn" = "arn:aws:iam::923377182840:user/belle"
#     "force_destroy" = false
#     "id" = "belle"
#     "name" = "belle"
#     "path" = "/"
#     "permissions_boundary" = ""
#     "tags" = tomap(null) /* of string */
#     "tags_all" = tomap({})
#     "unique_id" = "AIDA5N7MRVB4AZUYNAR5J"
#   }
#   "kitts" = {
#     "arn" = "arn:aws:iam::923377182840:user/kitts"
#     "force_destroy" = false
#     "id" = "kitts"
#     "name" = "kitts"
#     "path" = "/"
#     "permissions_boundary" = ""
#     "tags" = tomap(null) /* of string */
#     "tags_all" = tomap({})
#     "unique_id" = "AIDA5N7MRVB4N2ET4TVG2"
#   }

# In order to get just the ARNs output, you need:
output "all_new_arns" {
  value = values(aws_iam_user.another_example)[*].arn
}
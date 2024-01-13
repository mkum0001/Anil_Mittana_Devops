# # Commented due to state removal of resource using terraform state rm aws_s3_bucket.devsecopsb38tfstate
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "devsecopsb38-terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
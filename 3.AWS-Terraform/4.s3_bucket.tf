# Commented due to state removal of resource using terraform state rm aws_s3_bucket.mittanadevops235
# resource "aws_s3_bucket" "mittanadevops235" {
#   bucket = var.tf_state_bucket
#   tags = {
#     Name        = var.tf_state_bucket
#     Environment = var.environment
#   }
# }

# resource "aws_s3_bucket" "devsecopsb38megastar" {
#   bucket = "devsecopsb38superstar"

#   tags = {
#     Name        = "devsecopsb38superstar"
#     Environment = var.environment
#   }
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_s3_object" "file1" {
#   bucket = "devsecopsb38superstar"
#   key    = "AppGw.png"
#   source = "C:\\Users\\Training\\Desktop\\Class_Pics\\AppGw.png"
# }
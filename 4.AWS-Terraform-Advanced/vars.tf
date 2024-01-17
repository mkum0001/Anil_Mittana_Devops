variable "aws_region" {}
variable "owner" {}
variable "tf_state_bucket" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "key_name" {}
variable "public_subnets_cidr" {}
variable "private_subnets_cidr" {}
variable "azs" {}
variable "environment" { default = "dev" }
variable "instance_type" {}
variable "imagename" {}

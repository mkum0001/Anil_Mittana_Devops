output "public_subnet_1" {
  value = aws_subnet.public-subnets.0.id
}

output "private_subnet_1" {
  value = aws_subnet.private-subnets.0.id
}

output "all_public_subnet" {
  value = aws_subnet.public-subnets.*.id
}

output "all_private_subnet" {
  value = aws_subnet.private-subnets.*.id
}

output "local_public_subnet" {
  value = local.public_subnets_cidr
}
output "local_private_subnet" {
  value = local.private_subnets_cidr
}


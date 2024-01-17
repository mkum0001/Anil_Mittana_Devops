resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name  = "${var.vpc_name}-Public-RT"
    Owner = local.owner
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name  = "${var.vpc_name}-Private-RT"
    Owner = local.owner
  }
}

resource "aws_route_table_association" "public_subnets" {
  #count = 4
  #count = length(var.public_subnets_cidr)
  count          = length(local.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private_subnets" {
  #count = 4
  #count = length(var.private_subnets_cidr)
  count          = length(local.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}

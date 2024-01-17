locals {
  public_subnets_cidr  = distinct(var.public_subnets_cidr)
  private_subnets_cidr = distinct(var.private_subnets_cidr)
  owner                = upper(var.owner)
  ingress              = toset([9111, 9100, 111, 222, 333, 555, 555, 666, 666, 777, 777, 80, 443, 444, 333, 222, 111, 111, 222, 333, 1433, 1445, 7000, 7001, 7000, 7001])
  egress               = toset([9111, 8000, 111, 222, 333, 555, 555, 666, 666, 777, 777, 444, 888, 777, 666, 666, 777, 888, 666, 777, 888, 7000, 7001, 7000, 7001])
}
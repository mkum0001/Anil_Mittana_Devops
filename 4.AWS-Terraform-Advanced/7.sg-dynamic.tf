data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg_dynamic" {
  name        = "sg_dynamic"
  description = "Allow all inbound traffic using Dynamic Blocks"
  vpc_id      = aws_vpc.default.id
  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      #chomp removes newline characters at the end of a string.
      cidr_blocks = ["0.0.0.0/0", "${chomp(data.http.myip.response_body)}/32"]
    }
  }


  dynamic "egress" {
    for_each = local.egress
    content {
      from_port = egress.value
      to_port   = egress.value
      protocol  = "tcp"
      #chomp removes newline characters at the end of a string.
      cidr_blocks = ["0.0.0.0/0", "${chomp(data.http.myip.response_body)}/32"]
    }
  }
  #Dynamic Block Are Not used for Tags.

}

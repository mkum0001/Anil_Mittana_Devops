resource "aws_instance" "web-1" {
  ami                         = var.imagename
  availability_zone           = "us-east-1a"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "${var.vpc_name}-Server-1"
    Env   = var.environment
    Owner = var.owner
  }
  # root disk
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  # data disk
  # ebs_block_device {
  #   device_name           = "/dev/xvda"
  #   volume_size           = "5"
  #   volume_type           = "gp2"
  #   encrypted             = true
  #   delete_on_termination = true
  # }
  #Lifecycle
  # lifecycle {
  #   prevent_destroy = false
  # }
  #User Data for Bootstrapping
  user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<h1>Deployed via Terraform</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
	EOF
}
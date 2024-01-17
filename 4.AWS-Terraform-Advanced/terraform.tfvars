aws_region      = "us-east-1"
vpc_cidr        = "10.38.0.0/16"
vpc_name        = "DSO38"
key_name        = "anilpem"
environment     = "dev"
owner           = "JavAppTeam"
tf_state_bucket = "devsecopsb38tfstate"
instance_type   = "t2.micro"
#imagename            = "ami-06aa3f7caf3a30282"
imagename = {
  us-east-1 = "ami-0c7217cdde317cfec"
}
public_subnets_cidr  = ["10.38.1.0/24", "10.38.2.0/24", "10.38.3.0/24", "10.38.4.0/24", "10.38.5.0/24", "10.38.1.0/24", "10.38.2.0/24"]
private_subnets_cidr = ["10.38.10.0/24", "10.38.20.0/24", "10.38.30.0/24", "10.38.40.0/24", "10.38.50.0/24", "10.38.10.0/24", "10.38.20.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]


#Diff Count vs For-Each
#Count follown index and it will change if you add element at the start of the list.
#Count is good to iteration/looping for creating multiple resources.

#For-Each dont use index for creating rsource.
#For-Each good for dynamic-blocks like SG Ingress & Egress

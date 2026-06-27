module "vpc" {
  source = "terraform-aws-modules/vpc/aws"  # terraform registry module source so you need to do terraform init to download the module

  name = "my-auto-vpc"
  cidr = "10.0.0.0/16"  # Start: 10.0.0.0, End: 10.0.255.255 -> = 65,536 IP addresses

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env
  }
} 
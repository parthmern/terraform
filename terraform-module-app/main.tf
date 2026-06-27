module "dev-infra" {
  source        = "./infra-app"
  env           = "dev"
  instance_type = "t2.micro"
  ec2_ami_id    = "ami-0e5497a77ef21b5ac"
  bucket_name   = "infra-app-bucket"
}

module "stg-infra" {
  source        = "./infra-app"
  env           = "stg"
  instance_type = "t2.micro"
  ec2_ami_id    = "ami-0e5497a77ef21b5ac"
  bucket_name   = "infra-app-bucket"
}

module "prd-infra" {
  source        = "./infra-app"
  env           = "prd"
  instance_type = "t2.medium"
  instance_count = 2
  ec2_ami_id    = "ami-0e5497a77ef21b5ac"
  bucket_name   = "infra-app-bucket"
}

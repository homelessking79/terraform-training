provider "aws" {
  region = "ap-southeast-1"
}

module "my_vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy  = "default"
  vpc_id   = module.my_vpc.vpc_id
  azs = {
    "ap-southeast-1a" = "192.168.1.0/24"
    "ap-southeast-1b" = "192.168.2.0/24"
  }
  ig_id          = module.my_vpc.ig_id
  route_table_id = module.my_vpc.route_table_id
  subnet_id      = module.my_vpc.subnet_id
}

module "my_ec2" {
  subnet_id     = module.my_vpc.subnet_id
  source        = "../../modules/ec2"
  ec2_count     = 2
  instance_type = "t2.micro"
  ami_id        = "ami-0e5182fad1edfaa68"
  instance_name = "Dev"
  key_name      = "terraform-training"
  sg_ids        = [module.my_ec2.sg_id]
  vpc_id        = module.my_vpc.vpc_id
  sg_name       = "Allow web traffic on Dev environment"
}

module "my_nlb" {
  source            = "../../modules/nlb"
  subnet_id         = module.my_vpc.subnet_id
  target_group_name = "Dev-target-group"
  port              = 3000
  protocol          = "TCP"
  vpc_id            = module.my_vpc.vpc_id
  target_group_arn  = module.my_nlb.target_group_arn
  instance_id       = module.my_ec2.instance_id
  nlb_name          = "Dev"
  environment_name  = "Dev Environment"
  nlb_arn           = module.my_nlb.nlb_arn
}


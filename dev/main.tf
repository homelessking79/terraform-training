module "my_vpc" {
    source = "../Modules/VPC"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
    vpc_id = module.my_vpc.vpc_id
    subnet_cidr="192.168.1.0/24"
    ig_id = module.my_vpc.ig_id
    route_table_id = module.my_vpc.route_table_id
    subnet_id = module.my_vpc.subnet_id
}

module "my_ec2" {
    source = "../Modules/EC2"
    ec2_count  = 1
    instance_type = "t2.micro"
    subnet_id = module.my_vpc.subnet_id
    ami_id = "ami-0e5182fad1edfaa68"
    instance_name = "Dev"
    key_name = "terraform-training"
    sg_ids = [module.my_ec2.sg_id]
    vpc_id = module.my_vpc.vpc_id
    sg_name = "Allow web traffic on Dev environment"
}
module "vpc" {
    source = "../../modules/vpc"
    cidr_block = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
}

module "iam" {
  source = "../../modules/iam"
}

module "ec2" {
  source         = "../../modules/ec2"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = module.vpc.subnet_id
}

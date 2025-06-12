
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.vpc.public_subnet_id
  sg_id         = module.sg.sg_id
  key_name      = "your-key-name"
  instance_type = "t2.micro"
  ami_id        = "ami-02521d90e7410d9f0"
}

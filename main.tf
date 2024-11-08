provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "${var.cluster_name}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  public_subnet_tags   = { "kubernetes.io/role/elb" = "1" }
  private_subnet_tags  = { "kubernetes.io/role/internal-elb" = "1" }
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  # cluster_version = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # Node Group Configuration
  # node_groups = {
    # eks_nodes = {
      # desired_capacity = var.node_group_desired_capacity
      # max_capacity     = var.node_group_max_capacity
      # min_capacity     = var.node_group_min_capacity

      # instance_type    = "t3.medium"
      # key_name         = "my-key-pair"
    # }
  # }
}

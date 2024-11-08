variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_SESSION_TOKEN" {}


variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "node_group_desired_capacity" {
  default = 2
}

variable "node_group_max_capacity" {
  default = 3
}

variable "node_group_min_capacity" {
  default = 1
}

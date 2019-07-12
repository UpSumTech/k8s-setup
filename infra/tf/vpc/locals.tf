locals {
  region   = "eu-west-2"
  cluster  = "${var.cluster_name}"
  vpc_cidr = "10.1.0.0/16"

  azs = [
    "eu-west-2a",
    "eu-west-2b",
    "eu-west-2c",
  ]

  vpc_private_subnets = [
    "10.1.21.0/24",
    "10.1.22.0/24",
    "10.1.23.0/24",
  ]

  vpc_public_subnets = [
    "10.1.31.0/24",
    "10.1.32.0/24",
    "10.1.33.0/24",
  ]
}

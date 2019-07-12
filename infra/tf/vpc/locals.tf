locals {
  region   = "ca-central-1"
  cluster  = "${var.cluster_name}"
  vpc_cidr = "10.1.0.0/16"

  azs = [
    "ca-central-1a",
    "ca-central-1b",
  ]

  vpc_private_subnets = [
    "10.1.1.0/24",
    "10.1.2.0/24",
    "10.1.3.0/24",
    "10.1.4.0/24",
  ]

  vpc_public_subnets = [
    "10.1.101.0/24",
    "10.1.102.0/24",
    "10.1.103.0/24",
    "10.1.104.0/24",
  ]
}

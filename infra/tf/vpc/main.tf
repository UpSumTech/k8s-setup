module "k8s_vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  version                = "~> v2.0"
  name                   = "k8s_vpc"
  cidr                   = "${local.vpc_cidr}"
  azs                    = "${local.azs}"
  private_subnets        = "${local.vpc_private_subnets}"
  public_subnets         = "${local.vpc_public_subnets}"
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    "kubernetes.io/cluster/${local.cluster}" = "shared"
    "managed_by"                             = "terraform"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = true
    "private"                         = true
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = true
    "public"                 = true
  }
}

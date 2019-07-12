resource "aws_security_group" "http_ingress" {
  name   = "k8s_http_ingress"
  vpc_id = "${module.k8s_vpc.vpc_id}"

  tags = {
    "managed_by" = "terraform"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = "${local.vpc_public_subnets}"
  }
}

resource "aws_security_group" "https_ingress" {
  name   = "k8s_https_ingress"
  vpc_id = "${module.k8s_vpc.vpc_id}"

  tags = {
    "managed_by" = "terraform"
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = "${local.vpc_public_subnets}"
  }
}

output "k8s_vpc_id" {
  value = "${module.k8s_vpc.vpc_id}"
}

output "k8s_vpc_private_subnets" {
  value = "${module.k8s_vpc.private_subnets}"
}

output "k8s_vpc_private_subnet_cidrs" {
  value = "${module.k8s_vpc.private_subnets_cidr_blocks}"
}

output "k8s_vpc_public_subnets" {
  value = "${module.k8s_vpc.public_subnets}"
}

output "k8s_vpc_public_subnet_cidrs" {
  value = "${module.k8s_vpc.public_subnets_cidr_blocks}"
}

output "k8s_sg_http_ingress_id" {
  value = "${aws_security_group.http_ingress.id}"
}

output "k8s_sg_https_ingress_id" {
  value = "${aws_security_group.https_ingress.id}"
}

output "k8s_nat_public_ips" {
  value = "${module.k8s_vpc.nat_public_ips}"
}

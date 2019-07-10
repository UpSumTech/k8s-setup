output "region" {
  value = ["${local.region}"]
}

output "availability_zones" {
  value = ["${module.k8s_vpc.azs}"]
}

output "k8s_vpc_name" {
  value = "k8s_vpc"
}

output "k8s_vpc_id" {
  value = "${module.k8s_vpc.vpc_id}"
}

output "k8s_vpc_cidr" {
  value = "${module.k8s_vpc.vpc_cidr_block}"
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

output "k8s_vpc_private_route_table_ids" {
  value = ["${module.k8s_vpc.private_route_table_ids}"]
}

output "k8s_vpc_public_route_table_ids" {
  value = ["${module.k8s_vpc.public_route_table_ids}"]
}

output "k8s_nat_public_ips" {
  value = "${module.k8s_vpc.nat_public_ips}"
}

output "k8s_nat_gateway_ids" {
  value = "${module.k8s_vpc.natgw_ids}"
}

output "k8s_sg_http_ingress_id" {
  value = "${aws_security_group.http_ingress.id}"
}

output "k8s_sg_https_ingress_id" {
  value = "${aws_security_group.https_ingress.id}"
}

output "kops_state_s3_bucket" {
  value = "${aws_s3_bucket.kops_state.bucket}"
}

provider "aws" {
  region = "${local.region}"
}

terraform {
  required_version = "0.12.4"
  backend "s3" {
    bucket         = "suman-mukherjee-k8s-tf-state"
    key            = "infrastructure/vpc"
    region         = "ca-central-1"
    dynamodb_table = "k8s_tf_state_locks"
  }
}

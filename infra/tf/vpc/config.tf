provider "aws" {
  region = "${local.region}"
}

terraform {
  backend "s3" {
    bucket         = "suman-mukherjee-k8s-tf-state"
    key            = "infrastructure/vpc"
    region         = "ca-central-1"
    dynamodb_table = "k8s_tf_state_locks"
  }
}
